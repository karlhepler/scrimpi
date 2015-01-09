mongoose = require 'mongoose'

# Import base schema
TagSchema = require './_schema'

# Set fields
TagSchema.add
  name: String

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Tag', TagSchema