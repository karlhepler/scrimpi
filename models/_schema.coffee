# Import mongoose
mongoose = require 'mongoose'

# Export base schema with default paramters
module.exports =
  new mongoose.Schema
    created: type: Date, default: Date.now()
    modified: type: Date, default: Date.now()
    # User ID