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

At this point, all the RSpec code examples are passing, but we have failing `Cucumber` scenarios. We're "in the meantime", so to speak, where changing requirements from the outside are rendering out requirements on the inside incorrect.

Our new step definition want `Game.start()` to accept a secret code as an argument, but out `RSpec` examples assume that `start()` does not take any arguments. If we just add the argument to `start()`, then the specs fail with an argument error as well, but with `0 for 1` instead of `1 for 0`. To keep the specs passing while we're making changes to support the scenarios, modify `start()` to accept an argument with a default value, like so:

`ch6-adding-new-features/lib/codebreaker/game.rb`
```ruby
module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret=nil)
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end
  end
end
```

Run the specs, and they should all still pass.
<pre><code>
$ <b>rspec spec/codebreaker/game_spec.rb --color --format doc</b>

Codebreaker::Game
  #start
    sends a welcome message
    prompts for the first guess

Deprecation Warnings:

Using `should_receive` from rspec-mocks' old `:should` syntax without explicitly enabling the syntax is deprecated. Use the new `:expect` syntax or explicitly enable `:should` instead. Called from /Users/mikaelblomkvist/the-rspec-book/GettingStartedWithRSpecAndCucumber/ch6-adding-new-features/spec/codebreaker/game_spec.rb:10:in `block (3 levels) in <module:Codebreaker>'.


If you need more of the backtrace for any of these deprecations to
identify where to make the necessary changes, you can configure
`config.raise_errors_for_deprecations!`, and it will turn the
deprecation warnings into errors, giving you the full backtrace.

1 deprecation warning total

Finished in 0.00236 seconds (files took 0.22178 seconds to load)
2 examples, 0 failures
</pre></code>

Now run the `$ cucumber features/codebreaker_submits_guess.feature` scenarios, and you should see this:
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
42 steps (28 undefined, 14 passed)
0m0.094s

You can implement step definitions for undefined steps with these snippets:

When("I guess {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the mark should be {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
```

At this point, the scenarios are either passing or undefined, but none is failing, and the specs are passing. Now we can go in and modify the specs to pass a secret code to `start()`, like this

`ch6-adding-new-features/spec/codebreaker/game_spec.rb`:
```ruby
require 'spec_helper'

module Codebreaker
  describe Game do
    describe "#start" do
      let(:output) { double('output').as_null_object }
      let(:game)   { Game.new(output) }

      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end

      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.start('1234')
      end
    end
  end
end
```

Run the examples, and watch them pass.

<pre><code>
$ <b>rspec spec/codebreaker/game_spec.rb --color --format doc</b>

Codebreaker::Game
  #start
    sends a welcome message
    prompts for the first guess

Deprecation Warnings:

Using `should_receive` from rspec-mocks' old `:should` syntax without explicitly enabling the syntax is deprecated. Use the new `:expect` syntax or explicitly enable `:should` instead. Called from /Users/mikaelblomkvist/the-rspec-book/GettingStartedWithRSpecAndCucumber/ch6-adding-new-features/spec/codebreaker/game_spec.rb:10:in `block (3 levels) in <module:Codebreaker>'.


If you need more of the backtrace for any of these deprecations to
identify where to make the necessary changes, you can configure
`config.raise_errors_for_deprecations!`, and it will turn the
deprecation warnings into errors, giving you the full backtrace.

1 deprecation warning total

Finished in 0.0029 seconds (files took 0.14422 seconds to load)
2 examples, 0 failures
</pre></code>


Now modify `start()` again, this time removing the default value from the method definition

`ch6-adding-new-features/lib/codebreaker/game.rb`
```ruby
module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end
  end
end
```

Run the examples one more time, and they should still pass. Now run the `codebreaker_submits_guess.feature` again, and they should still be passing or undefined. But what about the `codebreaker_starts_game.feature` scenario?

Now that we don't have any failures in the feature we're working on or the specs, run `cucumber` with no arguments to run all (both) of the features. The output should include this:

```
Feature: code-breaker starts game
As a code-breaker
I want to start a game
So that I can break the code

  Scenario: start game                          # features/codebreaker_starts_game.feature:7
    Given I am not yet playing                  # features/step_definitions/codebreaker_steps.rb:15
    When I start a new game                     # features/step_definitions/codebreaker_steps.rb:19
      wrong number of arguments (given 0, expected 1) (ArgumentError)
      ./lib/codebreaker/game.rb:7:in `start'
      ./features/step_definitions/codebreaker_steps.rb:21:in `"I start a new game"'
      features/codebreaker_starts_game.feature:9:in `When I start a new game'
    Then I should see 'Welcome to Codebreaker!' # features/step_definitions/codebreaker_steps.rb:24
    And I should see 'Enter guess:'             # features/step_definitions/codebreaker_steps.rb:24

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
.
.
.
```

The step definition for `When I start a new game` is still calling `start()` with no argument. Modify that as follows

ch6-adding-new-features/features/step_definitions/codebreaker_steps.rb:
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
  game.start('1234')
end

Then("I should see {string}") do |string|
  fake_output.messages.should include(string)
end

Given("the secret code is {string}") do |string|
  game = Codebreaker::Game.new(fake_output)
  game.start(string)
end
```

Now all the specs should be passing, and all the scenarios are either passing or undefined.
