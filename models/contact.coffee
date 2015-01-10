mongoose = require 'mongoose'

# Import base schema
ContactSchema = require './_schema'

# Set fields
ContactSchema.add
  name: type: String, required: true, trim: true

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Contact', ContactSchema