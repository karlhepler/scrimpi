# https://github.com/madhums/node-express-mongoose-demo/blob/master/app/models/user.js
# This suggests that I just make a field for user_id in all schemas: http://scottksmith.com/blog/2014/05/29/beer-locker-building-a-restful-api-with-node-passport/

class Model
  constructor: ->
    {Schema, model} = require 'mongoose'
    @schema = new Schema
      created: type: Date, default: Date.now()
      modified: type: Date, default: Date.now()

    @model model('Banks', @schema)

    console.log '.Model Instantiated'

module.exports = Model