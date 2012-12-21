# Be - Behaviorial Expectations

"Oh, Behave!"

[Website](http://rubyworks.github.com.be) /
[Report Issue](http://github.com/rubyworks/be/issues) /
[Source Code](http://github.com/rubyworks/be)
( [![Build Status](https://secure.travis-ci.org/rubyworks/be.png)](http://travis-ci.org/rubyworks/be) )

<br/>

Be is a versitle, light-weight and BRASS compliant assertions framework
for Ruby. It utilizes an *assertor* design (<i>known as *matchers* in RSpec terminology</i>)
which meshes well with BDD nomenclature.

## Instruction

First you need to load the Be library into your test scope. There are two ways
to do this. The first is the simplest and just entails loading `be`.

    require 'be'

This loads the enitre library and includes `Be::World` into all scopes. The second
approach provides more control over where the Be methods are added. To do this
either require `be/should` or `be/expect` or both, and then include the
`Be::World` module into the scope where the methods are to be available.

    require 'be/expect'

    module Cucumber::World
      include Be::World
    end

After that it is simply a matter is using using `#should` or `#expect` with a target
object, and passing it the reuslt of calling `#be` or `#have` with testable critera.

    object = "string"

    object.should be.instance_of?(String)
    object.should have(6).size

    expect(object).to be.instance_of?(String)
    expect(object).to have(6).size

The only difference between `#be` and `#have` is the default criteria method that is
implied if none is given. In the base of `#be` it is `#==`, for `#have` it is `#include?`.

    "abc".should be("abc")

    [:a,:b,:c].should have(:b)

Be works on the principle of *assertors*, a type of functor, or higher-order
message. In RSpec these are know as *matchers*. Be provides the methods `#should`
and `#expect` that handle any object that converts to an assertor via a
`#to_assertor` method. The `#be` and `#have` method returns just that, a `Be::Delegator`
which orgnaizes all calls made against it to use as expectations in the `Be::Assertor`.


## Copyrights

Be is copyrighted open source software.

    Copyright (c) 2012 Rubyworks

Be is distributable in accordance with the **BSD-2-Clause** license.

See **License.txt** for details.

