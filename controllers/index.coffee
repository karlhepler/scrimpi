class Index extends require './.controller'

  # Just render the index page
  index: (req, res) ->
    res.render 'index'


# Instantiate and export ---------------------------------
module.exports = new Index