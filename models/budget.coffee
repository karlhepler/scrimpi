mongoose = require 'mongoose'
ObjectId = mongoose.Schema.Types.ObjectId;

# Import base schema
# BudgetSchema = require './_auth_schema'
BudgetSchema = require './_schema'

# Set fields
BudgetSchema.add
  year: type: Number, required: true
  month: type: Number, required: true, min: 1, max: 12
  comment: String

  goals: [
    limit:        type: Number, min: 0, required: true
    left_to_save: type: Number, required: true
    saved:        type: Number, required: true
    goal:         type: ObjectId, ref: 'Goal'
  ]

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Budget', BudgetSchema