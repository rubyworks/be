# Be - Behaviorial Expectations

"Oh, Behave!"

[Website](http://rubyworks.github.com.be) /
[Report Issue](http://github.com/rubyworks/be/issues) /
[Source Code](http://github.com/rubyworks/be) /
[Mailing List](http://google.groups.com/groups/rubyworks-mailinglist)

[![Build Status](https://secure.travis-ci.org/rubyworks/be.png)](http://travis-ci.org/rubyworks/be)

<br/>

<b>Be is a fully versitle, light-weight and BRASS compliant assertions framework
for Ruby. It utilizes an *assertor* design (*matchers* in RSpec terminology)
which meshes well with BDD nomenclatures.</b>

<br/>

## Instruction

Be's usage is very simple. It consits of using `#should` with a target object,
and passing it the reuslt of calling `#be` or `#have` with expectation critera.
Here is an example:

    require 'be'

    object = "string"

    object.should be.instance_of?(String)
    object.should have(6).size

The only difference betwee `#be` and `#have` is the default expectation method
that is used if none is provided. In the base of `#be` it is `#==`, for `#have` 
it is `#include?`.

    "abc".should be("abc")

    [:a,:b,:c].should have(:b)

Be works on the principle of *assertors*, a type of functor, or higher-order
function. In RSpec these are know as *matchers*. Be provides the method `#should`
for all Objects which accepts any object that converts to an assertor via a
`#to_assertor` method. The `#be` and `#have` method returns just that, a `Be::Delegator`
which orgnaizes all calls made against it to use as expectations in the `Be::Assertor`.


## Copyrights

Copyright (c) 2012 Rubyworks

Be is distributable in accordance with the **FreeBSD** license.

See License.txt for details.

