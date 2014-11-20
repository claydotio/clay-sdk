Clay = require 'clay-sdk-base'

# Function::bind polyfill
unless Function::bind
  # coffeelint: disable=missing_fat_arrows
  Function::bind = (oThis) ->

    # closest thing possible to the ECMAScript 5
    # internal IsCallable function
    throw new TypeError('Function.prototype.bind - what is trying to be bound' +
                        ' is not callable')  if typeof this isnt 'function'
    aArgs = Array::slice.call(arguments, 1)
    fToBind = this
    fNOP = -> null

    fBound = ->
      fToBind.apply (if this instanceof fNOP and oThis then this else oThis),
                    aArgs.concat(Array::slice.call(arguments))

    fNOP.prototype = this.prototype
    fBound.prototype = new fNOP()
    fBound
  # coffeelint: enable=missing_fat_arrows
ui = require './ui'

Clay 'register', {method: 'ui', fn: ui}

module.exports = Clay
