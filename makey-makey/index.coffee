#!/usr/local/bin/node
# ^-- This is the shebang reference that tells unix to run the node executable

five = require 'johnny-five'

five.Board().on 'ready', ()->
