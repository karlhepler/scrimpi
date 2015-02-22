mongoose = require 'mongoose'
ObjectId = mongoose.Schema.Types.ObjectId;

# Import base schema
# GoalSchema = require './_auth_schema'
GoalSchema = require './_schema'

# Set fields
GoalSchema.add
  name:     type: ObjectId, ref: 'GoalName', required: true
  goal:     type: Number, required: true, min: 0
  due_date: type: Date, required: true
  
  comment: String

  balance:  Number, default: 0
  spent:    Number, default: 0

  tags:  [ type: ObjectId, ref: 'Tag' ]
  banks: [
    bank:   type: ObjectId, ref: 'Bank'
    amount: type: Number, default: 0, min: 0
  ]

# Before saving...
GoalSchema.pre 'save', (next) ->
  # Use regex to capture the tags form comment and put them in the tags field
  @tags = @comment.match /#([0-9A-Z_]*[A-Z_]+[a-z0-9_üÀ-ÖØ-öø-ÿ]*)/gi if @isModified 'comment'
  next()

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Goal', GoalSchema
