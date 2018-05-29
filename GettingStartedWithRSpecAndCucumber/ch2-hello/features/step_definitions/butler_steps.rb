class CucumberButler
  def greet
    "Hello Cucumber!"
  end
end

Given("a butler") do
  @butler = CucumberButler.new
end

When("I send it the greet message") do
  @message = @butler.greet
end

Then("I should see {string}") do |string|
  @message.should == string
end
