# boco-error

Error module

    BocoError = require 'boco-error'
    assert = require 'assert'

## Creating a custom error class

    class MyError extends BocoError.CustomError

      setDefaults: ->
        @message = "My custom error" unless @message?
        super()

      setPayload: (payload = {}) ->
        @payload =
          foo: payload.foo
          bar: payload.bar

## Creating error instances

    error = new MyError()
    assert.equal "MyError", error.name
    assert.equal "My custom error", error.message

## Setting the payload

    error.setPayload foo: "Foo", bar: "Bar"
    assert.equal "Foo", error.payload.foo
    assert.equal "Bar", error.payload.bar

## The NotImplemented Error

    error = new BocoError.NotImplemented()
    assert.equal "NotImplemented", error.name
    assert.equal "Not implemented.", error.message
