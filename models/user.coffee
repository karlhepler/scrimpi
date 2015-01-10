mongoose = require 'mongoose'
Email = mongoose.SchemaTypes.Email
bcrypt = require 'bcrypt'
SALT_WORK_FACTOR = 10
# these values can be whatever you want - we're defaulting to a
# max of 5 attempts, resulting in a 2 hour lock
MAX_LOGIN_ATTEMPTS = 5,
LOCK_TIME = 2 * 60 * 60 * 1000;

# Import base schema
UserSchema = require './_schema'

# Set fields
UserSchema.add
  fname:          type: String, required: true, trim: true
  lname:          type: String, required: true, trim: true
  email:          type: Email,  required: true, index: unique: true
  password:       type: String, required: true

  loginAttempts:  type: Number, required: true, default: 0
  lockUntil:      type: Number



# Virtual field isLocked
UserSchema.virtual('isLocked').get () ->
  # check for a future lockUntil timestamp
  return !!(this.lockUntil && this.lockUntil > Date.now());


# Before saving
UserSchema.pre 'save', (next) ->
  # Only has the password if it has been modified
  return next() unless @isModified 'password'
  # Generate a salt
  bcrypt.genSalt SALT_WORK_FACTOR, (err, salt) =>
    # Handle errors
    if err then return next err
    # Hash the password using our new salt
    bcrypt.hash @password, salt, (err, hash) =>
      # Handle errors
      if err then return next err
      # Override the cleartext password with the hashed one
      @password = hash
      # ... and away it goes
      next()


# A middleware method to compare passwords
UserSchema.methods.comparePassword = (candidatePassword, callback) ->
  bcrypt.compare candidatePassword, @password, (err, isMatch) ->
    if err then return callback err
    callback null, isMatch

# Increments the login attempts
UserSchema.methods.incLoginAttempts = (callback) ->
  # If there is a previous lock that has expired, restart at 1
  if @lockUntil and @lockUntil < Date.now()
    return @update
      $set:   loginAttempts: 1
      $unset: lockUntil: 1
    , callback

  # Otherwise we're incrememting
  updates = $inc: loginAttempts: 1
  # Lock the account if we've reached max attempts and it's not locked already
  if @loginAttempts + 1 >= MAX_LOGIN_ATTEMPTS and not @isLocked
    updates.$set = lockUntil: Date.now() + LOCK_TIME
  # Return
  return @update updates, callback


# expose enum on the model, and provide an internal convenience reference 
reasons =
  UserSchema.statics.failedLogin = 
    NOT_FOUND: 0
    PASSWORD_INCORRECT: 1
    MAX_ATTEMPTS: 2


# Primary authentication function
UserSchema.statics.getAuthenticated = (email, password, callback) ->
  # Find a user via email
  @findOne email: email, (err, user) ->
    # Handle errors
    if err then return callback err
    # Make sure user exists
    return callback null, null, reasons.NOT_FOUND if not user
    
    # Check if the account is locked
    if user.isLocked
      # Increment login attempts
      return user.incLoginAttempts (err) ->
        # Handle errors
        if err then return callback err
        # Return showing it's locked
        return callback null, null, reasons.MAX_ATTEMPTS

    # Test for matching password
    user.comparePassword password, (err, isMatch) ->
      # Handle errors
      if err then return callback err

      # Check if it's a match
      if isMatch
        # If there's no lock or failed attempts, just return the user
        if not user.loginAttempts and not user.lockUntil then return callback null, user
        # Reset attempts and lock info
        updates =
          $set:   loginAttempts: 0
          $unset: lockUntil: 1
        # Update the user and return
        return user.update updates, (err) ->
          # Handle errors
          if err then return callback err
          # Return the user
          return callback null, user

      # Password is incorrect, so increment login attempts before responding
      user.incLoginAttempts (err) ->
        # Handle errors
        if err then return callback err
        # Return pass incorrect error
        return callback null, null, reasons.PASSWORD_INCORRECT


# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'User', UserSchema