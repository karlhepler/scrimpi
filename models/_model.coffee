
# https://github.com/madhums/node-express-mongoose-demo/blob/master/app/models/user.js
# This suggests that I just make a field for user_id in all schemas: http://scottksmith.com/blog/2014/05/29/beer-locker-building-a-restful-api-with-node-passport/
# Use bcrypt for passwords!!!
# http://devsmash.com/blog/implementing-max-login-attempts-with-mongoose
# http://stackoverflow.com/questions/12669615/add-created-at-and-updated-at-fields-to-mongoose-schemas

# Create base schema and export as new
# Import this into a model
# Use @schema inside the model to control pre, post, validation, etc

# class Model
#   constructor: ->    
#     @schema = new mongoose.Schema
#       created: type: Date, default: Date.now()
#       modified: type: Date, default: Date.now()
#       # user: type:

#     @model = mongoose.model(@constructor.name, @schema)

#     console.log @constructor.name+' Model Instantiated'

# schema = require './_schema'

# class Bank extends mongoose 

mongoose = require 'mongoose'

module.exports =
    new mongoose.Schema
      created: type: Date, default: Date.now()
      modified: type: Date, default: Date.now()
      # User ID

# module.exports = Model