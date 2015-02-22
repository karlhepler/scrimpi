mongoose = require 'mongoose'
ObjectId = mongoose.Schema.Types.ObjectId

# Import base schema
BankSchema = require './_auth_schema'

# Set fields
BankSchema.add
  name:     type: String, required: true, uppercase: true, trim: true, unique: true
  balance:  type: Number, required: true

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Bank', BankSchema