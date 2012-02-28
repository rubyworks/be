module Be

  #
  class BeDelegator < BasicObject
    def initialize(criteria={})
      @criteria = criteria
      @messages = []
    end

    #
    # Convert to Assertor. If `@messages` is empty then
    # defaults to calling `#==` with measure as argument.
    #
    def to_assertor
      if @messages.empty?
        measure  = @criteria.delete(:measure)
        messages = [[:==, [measure], nil]]
        HaveAssertor.new(messages, @criteria)
      else
        BeAssertor.new(@messages, @criteria)
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

    def equal?(other)
      @messages << [:==, [other], nil]
      self
    end
  end

  # BeAssertor is effectively the same as Assertor base class.
  #
  class BeAssertor < Assertor
  end

  #ToBe = BeDelegator.new

end

