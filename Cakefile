{spawn} = require 'child_process'

# ANSI Terminal Colors
bold  = '\x1B[0;1m'
red   = '\x1B[0;31m'
green = '\x1B[0;32m'
reset = '\x1B[0m'

# Useful way to log stuff
log = (message, color, explanation) ->
  console.log color + message + reset + ' ' + (explanation or '')

task 'dev', 'start dev env', ->
  options = ['app.coffee']
  nodemon = spawn 'nodemon', options
  nodemon.stdout.pipe process.stdout
  nodemon.stderr.pipe process.stderr
  log 'Watching coffee files & running server with nodemon', green