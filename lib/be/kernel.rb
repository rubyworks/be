require 'brass'

require 'be/core_ext'
require 'be/errors'
require 'be/assertor'
require 'be/delegator'
require 'be/should'

module Be

  #
  module Kernel

    # be
    #
    #   "object".should be("object")
    #   "object".should be.kind_of?(String)
    #
    def be(measure=:'n/a')
      criteria = {
        :compare => :==,
        :default => :==,
        :caller => caller
      }
      if measure != :'n/a'
        criteria[:measure] = measure
      end
      Be::Delegator.new(criteria)
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
      criteria = {
        :compare => :==,
        :default => :include?,
        :caller => caller
      }
      if measure != :'n/a'
        criteria[:measure] = measure
      end
      Be::Delegator.new(criteria)
    end

  end

end
