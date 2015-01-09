mongoose = require 'mongoose'
# Import base schema
schema = require './_schema'

# Set fields
schema.add
  name: String

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Bank', schema