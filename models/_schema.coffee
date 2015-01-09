# https://github.com/madhums/node-express-mongoose-demo/blob/master/app/models/user.js
# This suggests that I just make a field for user_id in all schemas: http://scottksmith.com/blog/2014/05/29/beer-locker-building-a-restful-api-with-node-passport/
# Use bcrypt for passwords!!!
# http://devsmash.com/blog/implementing-max-login-attempts-with-mongoose
# http://stackoverflow.com/questions/12669615/add-created-at-and-updated-at-fields-to-mongoose-schemas

# Import mongoose
mongoose = require 'mongoose'

# Export base schema with default paramters
Schema = new mongoose.Schema
  created: type: Date, default: Date.now()
  modified: type: Date, default: Date.now()


# Things to do before saving
Schema.pre 'save',(next) ->
  # Update modified field
  this.modified = Date.now()
  next()


# Export Schema
module.exports = Schema