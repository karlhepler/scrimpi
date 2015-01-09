module.exports =

  class Controller

    constructor: ->
      # Get the model
      @model = require "../models/#{@constructor.name[0...-1]}"


    # Send all models
    index: (req, res, next) ->
      @model.find().exec (err, models) ->
        if err then return next err
        res.json models


    # Send a single model
    get: (req, res, next) ->
      @model.findById req.params.id, (err, model) ->
        if err then return next err
        res.json model


    # Create a new model
    create: (req, res, next) ->
      # Handle errors
      if err then return next err
      # Gather the data
      for field of model.schema.paths
        attributes[field] = req.body[field] if req.body[field]? if field isnt "_id" and field isnt "__v"
      # Create the model
      thisModel = new @model attributes
      # Save the model
      thisModel.save (err) ->
        # Handle errors
        if err then return next err
        # Return the model
        res.json thisModel


    # Modify a single model
    modify: (req, res, next) ->
      # Find the model via id
      @model.findById req.params.id, (err, model) ->
        # Handle errors
        if err then return next err
        # Fill all the model's fields with data from matching fields
        for field of model.schema.paths
          thisModel[field] = req.body[field] if req.body[field]? if field isnt "_id" and field isnt "__v"
        # Save the model
        thisModel.save (err) ->
          # Handle error
          if err then return next err
          # Return model
          res.json thisModel


    # Delete a single model
    delete: (req, res, next) ->
      if err then return next err
      # Find the model
      @model.findById req.params.id, (err, model) ->
        if err then return next err
        model.remove (err, removedModel) ->
          if err then return next err
          res.json removedModel