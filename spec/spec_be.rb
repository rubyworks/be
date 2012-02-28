describe "be method" do

  it "should return a BeDelegator" do
    assert Be::BeDelegator === be
  end

  it "should return a BeDelegator with argument" do
    assert Be::BeDelegator === be('string')
  end

  it "should return a BeDelegator when method called" do
    assert Be::BeDelegator === be.anything
  end

  it "should return a BeDelegator with argument and method called" do
    assert Be::BeDelegator === be('something').anything
  end

  it "should work as assert equal when measure is given" do
    "string".should be('string')
    "string".should_not be('something else')
  end

  it "should assert equal when measure is geiven and method is called" do
    "string".should be('STRING').upcase
  end

  it "should assert queries, such as instance_of?" do
    "string".should be.instance_of?(String)
    "string".should_not be.instance_of?(Integer)
  end

  it "should assert operator queries such as ==" do
    "string".should be == 'string'
  end

  it "should assert for any lenght method chain" do
    "string".should be.upcase == 'STRING'
  end

end

