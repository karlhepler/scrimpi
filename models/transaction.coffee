mongoose = require 'mongoose'
ObjectId = mongoose.Schema.Types.ObjectId;

# Import base schema
TransactionSchema = require './_auth_schema'

# Set fields
TransactionSchema.add
  contact: type: ObjectId, ref: 'Contact', required: true
  comment: type: String
  date: type: Date, required: true
  tags: [ type: ObjectId, ref: 'Tag' ]
  amount: type: Number, required: true

  goals: [
    goal: type: ObjectId, ref: 'Goal', required: true
    amount: type: Number, required: true
  ]
  banks: [
    bank: type: ObjectId, ref: 'Bank', required: true
    amount: type: Number, required: true
  ]

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Transaction', TransactionSchema