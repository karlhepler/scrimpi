class Banks extends require './.model.coffee'

  # Setup schema
  constructor: ->
    super
    @schema.add
      name: type: String, unique: true
    @model model('Banks', @schema)

  # List all banks
  index: ->

  # Create a new bank
  create: (req, res) ->
    # Create the model
    bank = new @model
      name = req.body.name

    # Save the bank
    bank.save (err) ->
