class Object

  # TODO: Should we also support fluid notation?
  #   e.g. `[2,4,6].should.include?(4)`

  #
  def should(assay)
    assay.to_assertor.assert!(self)
  end

  #
  def should_not(assay)
    assay.to_assertor.refute!(self)
  end

end

