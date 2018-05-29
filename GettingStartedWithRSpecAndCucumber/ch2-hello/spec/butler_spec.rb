# I prefer to context of a butler rather then greeter, hence the change.

class RSpecButler
  def greet
    "Hello RSpec"
  end
end

describe "RSpec Butler" do
  it "should say 'Hello RSpec!' when it receives the greet() message" do
    butler = RSpecButler.new         # Given --> the context that we set up and take for granted as a  starting point.
    greeting = butler.greet          # When  --> the action that we're focused on.
    greeting.should == "Hello RSpec" # Then  --> the expected outcome.
  end
end
