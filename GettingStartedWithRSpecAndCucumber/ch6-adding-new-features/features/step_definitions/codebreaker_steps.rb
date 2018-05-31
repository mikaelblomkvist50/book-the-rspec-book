class FakeOutput
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def fake_output
  @fake_output ||= FakeOutput.new
end

Given("I am not yet playing") do

end

When("I start a new game") do
  game = Codebreaker::Game.new(fake_output)
  game.start('1234')
end

Then("I should see {string}") do |string|
  fake_output.messages.should include(string)
end

Given("the secret code is {string}") do |string|
  @game = Codebreaker::Game.new(fake_output)
  @game.start(string)
end

When("I guess {string}") do |string|
  @game.guess(string)
end

Then("the mark should be {string}") do |string|
  fake_output.messages.should include(string)
end
