mongoose = require 'mongoose'
# https://github.com/madhums/node-express-mongoose-demo/blob/master/app/models/user.js
# This suggests that I just make a field for user_id in all schemas: http://scottksmith.com/blog/2014/05/29/beer-locker-building-a-restful-api-with-node-passport/
# Use bcrypt for passwords!!!
# http://devsmash.com/blog/implementing-max-login-attempts-with-mongoose

class Model
  constructor: ->    
    @schema = new mongoose.Schema
      created: type: Date, default: Date.now()
      modified: type: Date, default: Date.now()
      # user: type:

    @model = mongoose.model(@constructor.name, @schema)

    console.log '.Model Instantiated'

module.exports = Model