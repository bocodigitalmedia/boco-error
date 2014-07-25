class CustomError

  constructor: (props = {}) ->
    Error.call this
    if typeof Error.captureStackTrace is 'function'
      Error.captureStackTrace this, @constructor
    @name = props.name
    @message = props.message
    @setPayload props.payload
    @setDefaults()

  setDefaults: ->
    @name = @constructor.name unless @name?

  setPayload: (params) ->
    @payload = @constructPayload params

  constructPayload: (params = {}) ->
    return params

module.exports = CustomError
