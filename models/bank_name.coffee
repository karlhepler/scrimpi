mongoose = require 'mongoose'

# Import base schema
BankNameSchema = require './_schema'

# Set fields
BankNameSchema.add
  name: type: String, required: true, uppercase: true, trim: true, unique: true

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'BankName', BankNameSchema