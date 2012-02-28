# Yes, the coolest and lightest assertion framework, ever!

require 'brass'
require 'be/core_ext'
require 'be/errors'
require 'be/assertor'
require 'be/tobe'
require 'be/tohave'
require 'be/should'

# be
#
#   "object".should be("object")
#   "object".should be.kind_of?(String)
#
def be(measure=:'n/a')
  if measure == :'n/a'
    Be::BeDelegator.new(:caller=>caller)
  else
    Be::BeDelegator.new(:measure=>measure, :caller=>caller)
  end
end

# have
#
#   "object".should have('bj')[1..2]
#   "object".should have.size == 6
#
#   "object".should have.size
#   "object".should have.member?('j')
#
def have(measure=:'n/a')
  if measure == :'n/a'
    Be::HaveDelegator.new(:caller=>caller)
  else
    Be::HaveDelegator.new(:measure=>measure, :caller=>caller)
  end
end

