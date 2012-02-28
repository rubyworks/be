describe "have method" do

  it "should return a to have delegator" do
    assert Be::HaveDelegator === have
  end

  it "with argument should return a HaveAssertor" do
    assert Be::HaveDelegator === have('string')
  end

  it "should delegate and return an assertor" do
    assert Be::HaveDelegator === have.anything
  end

  it "should defualt to #include? by default" do
    [1,2,3].should have(2)
  end

  it "should work to assert #size" do
    "string".should have(6).size
    "string".should have.size == 6
  end

  it "should work to refute #size" do
    "string".should_not have(7).size
    "string".should_not have.size == 7
  end

  it "should assert query methods" do
    "string".should have.include?('r')
    [1,2,3].should have.member?(1)
  end

  it "should handle method chains" do
    assert(Be::HaveDelegator === have.size.to_s)

    "string".should have.size.to_s == '6'
  end

end

