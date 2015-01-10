mongoose = require 'mongoose'

# Import base schema
GoalNameSchema = require './_schema'

# Set fields
GoalNameSchema.add
  name: type: String, required: true, uppercase: true, trim: true, unique: true

# INSTANTIATE AND EXPORT ---------------
module.exports = mongoose.model 'GoalName', GoalNameSchema