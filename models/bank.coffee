mongoose = require 'mongoose'
ObjectId = mongoose.Schema.Types.ObjectId

# Import base schema
BankSchema = require './_auth_schema'

# Set fields
BankSchema.add
  name:     type: ObjectId, ref: 'BankName', required: true
  priority: type: Number, min: 0, required: true
  balance:  type: Number, required: true

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Bank', BankSchema