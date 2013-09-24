#!/usr/local/bin/node

_ = require 'lodash'
five = require 'johnny-five'

# Simple function for generating buttons
generateButton = (pin)->
    return new five.Button {
        pin: pin
    }

five.Board().on 'ready', ()->

    # an object for pushing our new buttons into
    injectables = {}

    # the pertinent makey makey pins
    makeyPins = {
        click: 6
        space: 7
        right: 15
        left: 13
        down: 8
        up: 12
    }

    # handlers for those same pins
    handlers =
        click: ()->
            console.log 'click pressed!'
        space: ()->
            console.log 'space pressed!'
        right: ()->
            console.log 'right pressed!'
        left: ()->
            console.log 'left pressed!'
        up: ()->
            console.log 'up pressed!'
        down: ()->
            console.log 'down pressed!'

    # simple way of looping through the pins
    _(makeyPins).keys().each (key)->
        # the pin
        pin = makeyPins[key]
        # make a button
        button = generateButton pin
        # add the handler
        button.on 'down', handlers[key]
        # add the button to our injectables
        injectables[key] = button

    # this makes each of our buttons available in the repl
    this.repl.inject injectables
