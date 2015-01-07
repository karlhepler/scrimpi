class Banks extends require './.controller'

  # Just render the index page
  index: (req, res) ->
    @bankModel = require '../models/banks'
    res.send @bankModel
    # res.render 'index'


# Instantiate and export ---------------------------------
module.exports = new Banks