Feature: butler says hello

  In order to start learning RSpec and Cucumber
  As a reader of the RSpec Book
  I want a butler to say Hello

  Scenario: butler says hello
    Given a butler
    When I send it the greet message
    Then I should see "Hello Cucumber!"

# $ cucumber features
# Feature: butler says hello
#   In order to start learning RSpec and Cucumber
#   As a reader of the RSpec Book
#   I want a butler to say Hello
#
#   Scenario: butler says hello           # features/butler_says_hello.feature:7
#     Given a butler                      # features/butler_says_hello.feature:8
#     When I send it the greet message    # features/butler_says_hello.feature:9
#     Then I should see "Hello Cucumber!" # features/butler_says_hello.feature:10
#
# 1 scenario (1 undefined)
# 3 steps (3 undefined)
# 0m0.045s
#
# You can implement step definitions for undefined steps with these snippets:
#
# Given("a butler") do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# When("I send it the greet message") do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# Then("I should see {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end
