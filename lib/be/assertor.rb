module Be

  # An *assertor* is what RSpec calls a *matcher*.
  #
  class Assertor

    #
    def initialize(messages, criteria={})
      @messages   = messages
      @criteria   = criteria
      @comparator = criteria[:compare] || :==
    end

    #
    def pass?(target)
      result = target
      @messages.each do |op, args, blk|
        result = result.__send__(op, *args, &blk)
      end

      if @criteria.key?(:measure)
        @criteria[:measure].__send__(@comparator, result)
      else
        result
      end
    end

    #
    def fail?(target)
      ! pass?(target)
    end

    #
    def assert!(target)
      handle(pass?(target), target)
    end

    #
    def refute!(target)
      handle(fail?(target), target)
    end

    alias_method :==, :pass?
    alias_method :!=, :fail?

    alias_method :=~, :assert!
    alias_method :!~, :refute!

    alias_method :===, :assert!

  private

    #
    #
    #
    def handle(result, target)
      if result
        increment_passing
      else
        increment_failing

        error_class = Be::ASSERTION_ERRORS[@operator] || StandardError

        msg = assert_message(target) #, @operator, @arguments)
        err = error_class.new(msg)
        err.set_backtrace(@criteria[:caller] || caller[2..-1])
        err.set_assertion(true)
        raise err
      end
    end

    #
    # Produce an error message.
    #
    def assert_message(target)
      #"#{target.inspect} #{@operator} #{@arguemnts.map{ |x| x.inspect }}"

      s = "b"
      r = target

      sigs = []

      @messages.each do |meth, args, blk|
        vars = []
        list = []

        args.each do |a|
          vars << s
          list << "#{s}) " + a.inspect
          s = s.succ
        end

        sigs << [meth, vars, list]
      end

      msgs = []
      vest = ["a) #{r.inspect}"]
      sigs.each do |meth, vars, list|
        msgs << "#{meth}(#{vars.join(', ')})"
        vest << list.join("\n") unless list.empty?
      end
 
      "a." + msgs.join(".") + "\n" + vest.join("\n")
    end

    #
    #
    #
    def refute_message(target)
      "! " + assert_message(target)
    end

    #
    # Increment BRASS standard assertion counts for passing assertion.
    #
    def increment_passing
      $ASSERTION_COUNTS[:total] += 1
      $ASSERTION_COUNTS[:pass]  += 1
    end

    #
    # Increment BRASS standard assertion counts for failing assertion.
    #
    def increment_failing
      $ASSERTION_COUNTS[:total] += 1
      $ASSERTION_COUNTS[:fail]  += 1
    end

  public

    # The following methods allow these to work as RSpec matchers.

    # For RSpec matcher compatability.
    alias_method :matches?, :pass?

    # For RSpec matcher compatability.
    alias_method :does_not_match?, :fail?

    # For RSpec matcher compatability.
    alias_method :failure_message_for_should, :assert_message

    # For RSpec matcher compatability.
    alias_method :failure_message_for_should_not, :refute_message

  end

end
