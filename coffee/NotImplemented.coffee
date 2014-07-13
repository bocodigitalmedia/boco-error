CustomError = require './CustomError'

module.exports = class NotImplemented extends CustomError
  setDefaults: ->
    @message = "Not implemented."
    super()
