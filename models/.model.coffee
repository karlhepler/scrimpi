class Model
  constructor: ->
    {Schema, model} = require 'mongoose'
    @schema = new Schema
      created: type: Date, default: Date.now()
      modified: type: Date, default: Date.now()
      
    console.log '.Model Instantiated'

module.exports = Model