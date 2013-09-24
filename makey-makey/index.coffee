#!/usr/local/bin/node

five = require 'johnny-five'
_ = require 'lodash'

# Simple function for generating buttons
generateButton = (pin)->
    return new five.Button {
        pin: pin
    }

five.Board().on 'ready', ()->
    # an object for pushing our new buttons into
    injectables = {}
    # a quick way to generate all the buttons
    _([0..29]).each (pin)->
        # make a button
        newButton = generateButton pin
        # add a simple handler for the button
        newButton.on 'down', ()->
            console.log "Button #{pin} pressed!"
        # add the new button to our injectables object
        injectables['button'+pin] = newButton

    # this makes each of our buttons available in the repl
    this.repl.inject injectables
