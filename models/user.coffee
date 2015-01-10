mongoose = require 'mongoose'
Email = mongoose.SchemaTypes.Email

# Import base schema
UserSchema = require './_schema'

# Set fields
UserSchema.add
  fname:    type: String, required: true, trim: true
  lname:    type: String, required: true, trim: true
  email:    type: Email,  required: true, unique: true
  password: type: String, required: true

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'User', UserSchema