describe "expect method" do

  it "should return an Be::Expector" do
    assert Be::Expector === expect(:foo)
  end

  it "should handle #to as an assertion" do
    expect(:foo).to be(:foo)
  end

  it "should handle #to_not as a refutation" do
    expect(:foo).to_not be(:bar)
  end

end

