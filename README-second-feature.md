###  Chapter 6 Adding New Features

Run `cucumber features/codebreaker_submits_guess.feature`:

```
Feature: code-breaker submits guess
  The code-breaker submits a guess of four numbers. The game marks the guess with + and - signs.

  For each number in the guess that matches the number and position of a number in the secret code, the mark includes one + sign. For each number in the guess that matches the number but not the position of a number in the secret code, the mark includes one - sign.

  Scenario Outline: submit guess      # features/codebreaker_submits_guess.feature:7
    Given the secret code is "<code>" # features/codebreaker_submits_guess.feature:8
    When I guess "<guess>"            # features/codebreaker_submits_guess.feature:9
    Then the mark should be "<mark>"  # features/codebreaker_submits_guess.feature:10

    Scenarios: no matches
      | code | guess | mark |
      | 1234 | 5555  |      |

    Scenarios: 1 number correct
      | code | guess | mark |
      | 1234 | 1555  | +    |
      | 1234 | 2555  | -    |

    Scenarios: 2 numbers correct
      | code | guess | mark |
      | 1234 | 5254  | ++   |
      | 1234 | 5154  | +-   |
      | 1234 | 2545  | --   |

    Scenarios: 3 numbers correct
      | code | guess | mark |
      | 1234 | 5234  | +++  |
      | 1234 | 5134  | ++-  |
      | 1234 | 5124  | +--  |
      | 1234 | 5123  | ---  |

    Scenarios: all numbers correct
      | code | guess | mark |
      | 1234 | 1234  | ++++ |
      | 1234 | 1243  | ++-- |
      | 1234 | 1423  | +--- |
      | 1234 | 4321  | ---- |

14 scenarios (14 undefined)
42 steps (42 undefined)
0m0.084s

You can implement step definitions for undefined steps with these snippets:

Given("the secret code is {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I guess {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the mark should be {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
```

....As we saw earlier, the output includes the contents of the file listed previously, plus a summary and code snippets for any undefined steps. Here is the summary and just a few of the code snippets:
```
14 scenarios (14 undefined)
42 steps (42 undefined)
0m0.084s

You can implement step definitions for undefined steps with these snippets:

Given("the secret code is {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I guess {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the mark should be {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
```

The summary says we have fourteen scenarios, one for each nonheader row in the tables in each group of scenarios. All fourteen scenarios are considered undefined because we don't have step definitions defined for them. so now, with that help from `Cucumber`, let's write some step definitions.

Copy the first snippet:
```ruby
Given("the secret code is {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
```

into `features/step_definitions/codebreaker_steps.rb`  and modify it as follows:
```ruby
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
  game.start
end

Then("I should see {string}") do |string|
  fake_output.messages.should include(string)
end

Given("the secret code is {string}") do |string|
  game = Codebreaker::Game.new(fake_output)
  game.start(string)
end
```

....This will capture the code (1234, for example) and pass it to the body of the step definition. The first line of the body should look familiar, because it is just like the first step in `I start a new game`. Then the last line passes in the secret code from the match group.

Now run `cucumber features/codebreaker_submits_guess.feature` again, and you'll see output including this:

```
Feature: code-breaker submits guess
  The code-breaker submits a guess of four numbers. The game marks the guess with + and - signs.

  For each number in the guess that matches the number and position of a number in the secret code, the mark includes one + sign. For each number in the guess that matches the number but not the position of a number in the secret code, the mark includes one - sign.

  Scenario Outline: submit guess      # features/codebreaker_submits_guess.feature:7
    Given the secret code is "<code>" # features/codebreaker_submits_guess.feature:8
    When I guess "<guess>"            # features/codebreaker_submits_guess.feature:9
    Then the mark should be "<mark>"  # features/codebreaker_submits_guess.feature:10

    Scenarios: no matches
      | code | guess | mark |
      | 1234 | 5555  |      |
      wrong number of arguments (given 1, expected 0) (ArgumentError)
      ./lib/codebreaker/game.rb:7:in `start'
      ./features/step_definitions/codebreaker_steps.rb:30:in `"the secret code is {string}"'
      features/codebreaker_submits_guess.feature:14:in `Given the secret code is "1234"'
      features/codebreaker_submits_guess.feature:8:in `Given the secret code is "<code>"'

    Scenarios: 1 number correct
      | code | guess | mark |
      | 1234 | 1555  | +    |
      wrong number of arguments (given 1, expected 0) (ArgumentError)
      ./lib/codebreaker/game.rb:7:in `start'
      ./features/step_definitions/codebreaker_steps.rb:30:in `"the secret code is {string}"'
      features/codebreaker_submits_guess.feature:18:in `Given the secret code is "1234"'
      features/codebreaker_submits_guess.feature:8:in `Given the secret code is "<code>"'
      | 1234 | 2555  | -    |
      wrong number of arguments (given 1, expected 0) (ArgumentError)
      ./lib/codebreaker/game.rb:7:in `start'
      ./features/step_definitions/codebreaker_steps.rb:30:in `"the secret code is {string}"'
      features/codebreaker_submits_guess.feature:19:in `Given the secret code is "1234"'
      features/codebreaker_submits_guess.feature:8:in `Given the secret code is "<code>"'
```

You should see the `ArgumentError` for every scenario. This is actualluy good news, becasue the error tells us that everything is wired up correctly, and we know what we have to do next: get the `start()` method on `Game` to accept the secret code as an argument.
