CustomError = require './CustomError'

class NotImplemented extends CustomError
  setDefaults: ->
    @message = "Not implemented."
    super()

module.exports = NotImplemented
