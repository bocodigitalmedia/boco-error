# boco-error

Commands and utilities for working with Errors.

    BocoError = require 'boco-error'
    assert = require 'assert'

# CustomError class

A common use case would be extending the CustomError class for each type of error within your domain.

## Creating a custom error class

    class MyError extends BocoError.CustomError

You can set a default message for all errors of this type by overriding the `setDefaults` method. Don't forget to call `super()` *after* your custom defaults are set.

      setDefaults: ->
        @message = "My custom error" unless @message?
        super()

Overriding the `constructPayload` method allows you to customize the payload for this error type.

      constructPayload: (params = {}) ->
        foo: params.foo
        bar: params.bar

## Creating error instances

You create an instance of the error class just like any other. By default the name of the error is inferred using the name of the `constructor`.

    error = new MyError()

    assert.equal "MyError", error.name
    assert.equal "My custom error", error.message

## Setting the payload

You can set the payload directly in the constructor, or set it manually after construction. Note that the `baz` property we provided does not make its way to the payload due to our overridden `constructPayload` method.

    error.setPayload foo: "Foo", bar: "Bar", baz: "Baz"

    assert.equal "Foo", error.payload.foo
    assert.equal "Bar", error.payload.bar
    assert.equal undefined, error.payload.baz


# NotImplemented class

Represents an error caused by a method that has not been implemented.

A common use case is within abstract or base classes that require certain methods to be overridden.

    class AbstractFoo
      test: -> throw new BocoError.NotImplemented

    abstract = new AbstractFoo
    assert.throws abstract.test, BocoError.NotImplemented

The concrete classes then override this method, preventing the `NotImplemented` error from firing.

    class ConcreteFoo extends AbstractFoo
      test: -> "foo"

    concrete = new ConcreteFoo
    assert.equal "foo", concrete.test()
