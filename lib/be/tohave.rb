module Be

  #
  class HaveDelegator < BasicObject
    def initialize(criteria={})
      @criteria = criteria
      @messages = []
    end

    #
    # Convert to Assertor. If `@messages` is empty then
    # defaults to calling `#include?` with measure as 
    # argument.
    #
    def to_assertor
      if @messages.empty?
        measure  = @criteria.delete(:measure)
        messages = [[:include?, [measure], nil]]
        HaveAssertor.new(messages, @criteria)
      else
        HaveAssertor.new(@messages, @criteria)
      end
    end

    def method_missing(name, *args, &blk)
      @messages << [name, args, blk]
      self
    end

    def ==(other)
      @messages << [:==, [other], nil]
      self
    end
  end

  #
  class HaveAssertor < Assertor
    #
    def initialize(messages, criteria)
      @messages = messages
      @criteria = criteria
    end

    #
    def pass?(target)
      result = target
      @messages.each do |op, args, blk|
        result = result.__send__(op, *args, &blk)
      end

      if @criteria.key?(:measure)
        @criteria[:measure] == result
      else
        result
      end
    end
  end

  #ToHave = HaveDelegator.new

end

