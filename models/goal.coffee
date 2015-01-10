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

  tags:     [ type: ObjectId, ref: 'Tag' ]
  banks:    [ type: ObjectId, ref: 'Bank' ] # Not sure if I should include funded field or not... I'm thinking not

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Goal', GoalSchema