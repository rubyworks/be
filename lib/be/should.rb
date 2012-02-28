class Object

  #
  def should(assay)
    assay.to_assertor.assert!(self)
  end

  #
  def should_not(assay)
    assay.to_assertor.refute!(self)
  end

end

