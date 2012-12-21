require 'be/world'

module Be

  # Encapsulate an expectation.
  #
  class Expector

    # Subject matter to the expectation.
    attr :subject

    def initialize(subject)
      @subject = subject
    end

    def to(assay)
      assay.to_assertor.assert!(subject)
    end

    def to_not(assay)
      assay.to_assertor.refute!(subject)
    end

    alias :not_to :to_not
  end

  module World
    private

    # Expect notation is similar to #should, but
    # doesn't need to extend the object.
    #
    #   expect(10).to be(10)
    #
    def expect(object)
      Expector.new(object)
    end
  end

end


