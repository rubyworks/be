module Be

  # Delegator acts as the go-between between the subjunctive call
  # and the Assertor.
  #
  class Delegator < BasicObject

    #
    # Initialize new Delegator.
    #
    def initialize(criteria={})
      @criteria = criteria
      @messages = []
    end

    #
    # Convert to Assertor. If `@messages` is empty then
    # defaults to calling method given by `criteria[:default]`
    # or `#==` failing that.
    #
    def to_assertor
      if @messages.empty?
        default  = @criteria.delete(:default) || :==
        measure  = @criteria.delete(:measure)
        messages = [[default, [measure], nil]]
        Assertor.new(messages, @criteria)
      else
        Assertor.new(@messages, @criteria)
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

end

