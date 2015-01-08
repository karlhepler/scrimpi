module.exports =

  class Controller

    constructor: ->
      @model = require '../models/'+@constructor.name.slice(0,-1)

    # Send all models
    index: (req,res) ->
      @model.find().exec (err, models) ->
        if err then res.send 500,err
        res.send models

    # Send a single model
    get: (req,res) ->
      @model.findById req.params.id, (err, model) ->
        if err then res.send 500,err
        res.send model

    modify: (req,res) ->
      @model.findById req.params.id, (err, model) ->
        if err then res.send 500, err
        for field of model.schema.paths
          thisModel[field] = req.body[field]  if req.body[field] isnt `undefined`  if (field isnt "_id") and (field isnt "__v")

    create: (req,res) ->
      res.send @constructor.name+' Create'

    delete: (req,res) ->
      res.send @constructor.name+' Delete'