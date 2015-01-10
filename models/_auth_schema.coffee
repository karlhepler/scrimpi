mongoose = require 'mongoose'
ObjectId = mongoose.Schema.Types.ObjectId

# Import base schema
AuthSchema = require './_schema'

# Set fields
AuthSchema.add
  user: type: ObjectId, ref: 'User', required: true


# Export the schema
module.exports = AuthSchema