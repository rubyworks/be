require 'be/world'

class Object
  public

  #
  # Object extension for asserting.
  #
  #   10.should be(10)
  #
  def should(assay)
    assay.to_assertor.assert!(self)
  end

  #
  # Object extension for refuting.
  #
  #   10.should_not be(5)
  #
  def should_not(assay)
    assay.to_assertor.refute!(self)
  end

  #
  # Alternative for #should_not.
  #
  alias :should! :should_not

end

