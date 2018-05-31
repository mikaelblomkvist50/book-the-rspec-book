Feature: code-breaker starts game

As a code-breaker
I want to start a game
So that I can break the code

Scenario: start game
  Given I am not yet playing
  When I start a new game
  Then I should see 'Welcome to Codebreaker!'
  And I should see 'Enter guess:'

# $ cucumber features/codebreaker_starts_game.feature
# Feature: code-breaker starts game
# As a code-breaker
# I want to start a game
# So that I can break the code
#
#   Scenario: start game                          # features/codebreaker_starts_game.feature:7
#     Given I am not yet playing                  # features/codebreaker_starts_game.feature:8
#     When I start a new game                     # features/codebreaker_starts_game.feature:9
#     Then I should see 'Welcome to Codebreaker!' # features/codebreaker_starts_game.feature:10
#     And I should see 'Enter guess:'             # features/codebreaker_starts_game.feature:11
#
# 1 scenario (1 undefined)
# 4 steps (4 undefined)
# 0m0.054s
#
# You can implement step definitions for undefined steps with these snippets:
#
# Given("I am not yet playing") do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# When("I start a new game") do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# Then("I should see {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end
