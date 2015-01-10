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

# Before saving...
TransactionSchema.pre 'save', (next) ->
  # Maybe use this.isModified or this.isDirectModified and/or this.isNew to help only do this if comment is modified
  # Use regex to capture the tags form comment and put them in the tags field  
  @tags = @comment.match /#([0-9A-Z_]*[A-Z_]+[a-z0-9_üÀ-ÖØ-öø-ÿ]*)/gi if @isNew or @comment.isDirectModified
  next()

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'Transaction', TransactionSchema