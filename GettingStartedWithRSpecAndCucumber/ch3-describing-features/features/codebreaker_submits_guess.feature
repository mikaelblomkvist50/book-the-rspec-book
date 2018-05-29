Feature: code-breaker submits guess

  The code-breaker submits a guess of four numbers. The game marks the guess with + and - signs.

  For each number in the guess that matches the number and position of a number in the secret code, the mark includes one + sign. For each number in the guess that matches the number but not the position of a number in the secret code, the mark includes one - sign.

  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

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

# $ cucumber features
# Feature: code-breaker submits guess
#   The code-breaker submits a guess of four numbers. The game marks the guess with + and - signs.
#
#   For each number in the guess that matches the number and position of a number in the secret code, the mark includes one + sign. For each number in the guess that matches the number but not the position of a number in the secret code, the mark includes one - sign.
#
#   Scenario Outline: submit guess      # features/codebreaker_submits_guess.feature:7
#     Given the secret code is "<code>" # features/codebreaker_submits_guess.feature:8
#     When I guess "<guess>"            # features/codebreaker_submits_guess.feature:9
#     Then the mark should be "<mark>"  # features/codebreaker_submits_guess.feature:10
#
#     Scenarios: no matches
#       | code | guess | mark |
#       | 1234 | 5555  |      |
#
#     Scenarios: 1 number correct
#       | code | guess | mark |
#       | 1234 | 1555  | +    |
#       | 1234 | 2555  | -    |
#
#     Scenarios: 2 numbers correct
#       | code | guess | mark |
#       | 1234 | 5254  | ++   |
#       | 1234 | 5154  | +-   |
#       | 1234 | 2545  | --   |
#
#     Scenarios: 3 numbers correct
#       | code | guess | mark |
#       | 1234 | 5234  | +++  |
#       | 1234 | 5134  | ++-  |
#       | 1234 | 5124  | +--  |
#       | 1234 | 5123  | ---  |
#
#     Scenarios: all numbers correct
#       | code | guess | mark |
#       | 1234 | 1234  | ++++ |
#       | 1234 | 1243  | ++-- |
#       | 1234 | 1423  | +--- |
#       | 1234 | 4321  | ---- |
#
#
# 14 scenarios (14 undefined)
# 42 steps (42 undefined)
# 0m0.082s
#
# You can implement step definitions for undefined steps with these snippets:
#
# Given("the secret code is {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# When("I guess {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# Then("the mark should be {string}") do |string|
#   pending # Write code here that turns the phrase above into concrete actions
# end
