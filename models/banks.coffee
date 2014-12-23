class Banks extends require './.model.coffee'

  # Setup schema
  constructor: ->
    super
    @schema.add
      name: type: String, unique: true    

  # List all banks
  index: ->
    return @model.find

  # Create a new bank
  create: (req, res) ->
    # Create the model
    bank = new @model
      name: req.body.name

    # Save the bank
    bank.save (err) ->


# INSTANTIATE AND EXPORT ---------------
module.exports new Banks