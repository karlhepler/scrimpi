mongoose = require 'mongoose'
ObjectId = mongoose.Schema.Types.ObjectId;

# Import base schema
GoalSchema = require './_auth_schema'

# Set fields
GoalSchema.add
  name:     type: ObjectId, ref: 'GoalName', required: true
  goal:     type: Number, required: true, min: 0
  due_date: type: Date

  balance:  Number
  spent:    Number

  budgets: [
    month_year:   Date
    limit:        type: Number, min: 0
    left_to_save: Number
    saved:        Number
  ]

  priority: type: Number, min: 0
  tags:     [ type: ObjectId, ref: 'Tag' ]
  banks:    [ type: ObjectId, ref: 'Bank' ] # Not sure if I should include funded field or not... I'm thinking not

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Goal', GoalSchema