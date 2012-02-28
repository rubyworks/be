module Be
  # Map assertion methods to the Errors that they should raise.
  #
  # In the future there is good chance this will depend on the Assay
  # library instead of defining our own error classes here. However
  # we'll wait until that library matures further before making that
  # leap.
  #
  ASSERTION_ERRORS = {}
end

class Exception
  #
  def self.be(name)
    Be::ASSERTION_ERRORS[name.to_sym] = self
  end
end

class TypeError
  be :instance_of?
  be :kind_of?
end

class EqualityError < StandardError
  be :==
  be :eql?
  be :equal?
end

