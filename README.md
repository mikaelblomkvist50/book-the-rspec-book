# The RSpec Book Behaviour-Driven Development with RSpec, Cucumber, and Friends

The one I possess is:
* Version: 2011-4-07
* P2.0 printing, May 2011

* Purchase from [here](https://pragprog.com/book/achbd/the-rspec-book)
* Review on [Goodreads](https://www.goodreads.com/book/show/6261920-the-rspec-book)

### Ruby and Gem Versions in my Book

* ruby - 1.8.7
* rubygems - 1.3.7
* rspec - 2.0.0
* rspec-rails - 2.0.0
* cucumber - 0.9.2
* cucumber-rails - 0.3.2
* database_cleaner - 0.5.2
* webrat - 0.7.2
* selenium-client -1.2.18
* rails - 3.0.0

### Ruby and Gem Versions I use in [Getting Started with Rspec and Cucumebr](https://github.com/mikaelblomkvist50/the-rspec-book/blob/master/GettingStartedWithRSpecAndCucumber.md)

* `$ ruby -v` = ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin17]
* `$  gem --version` = 2.6.14
* `$ rvm rubygems current` = Rubygems 2.6.14 already available in installed ruby, skipping installation, use --force to reinstall.
* `$ rspec -v` =
  * RSpec 3.7
    - rspec-core 3.7.1
    - rspec-expectations 3.7.0
    - rspec-mocks 3.7.0
    - rspec-support 3.7.1
* `$ rspec-rails -v` = -bash: rspec-rails: command not found
* `$ cucumber --version` = 3.1.0
* `$ cucumber-rails -v` = -bash: cucumber-rails: command not found
* `$ database_cleaner -v` = -bash: database_cleaner: command not found
* `$ webrat -v` = -bash: webrat: command not found
* `$ selenium-client -v` = -bash: selenium-client: command not found
* `$ rails -v` =
```
Rails is not currently installed on this system. To get the latest version, simply type:

    $ sudo gem install rails

You can then rerun your "rails" command.
```

[Forward](#forward) **|**
[Chapter 1 Introduction](#chapter-1-introduction) **|**
[Chapter 2 Hello](#chapter-2-hello) **|**
[Chapter 3 Describing Features](#chapter-3-describing-features) **|**
[Chapter 4  Automating Features with Cucumber](#chapter-4-automating-features-with-cucumber) **|**


### Forward

....this book is not for....Ruby programmers. ...If you read this book, that meme will change the way you program in Java, C#, Python, or (oh God, the thought) COBOL! This book will change the way you code--period! ....You see, they've cleverly constructed the Ruby code in this book so that it can be understood by (gasp) any programmer at all! -- Robert C. Martin

### Chapter 1 Introduction

....this is where the Test in `TDD` becomes a problem. Specifically, it is the idea of `unit testing` that often leads new `TDDers` to verify things such as making sure that a `register()` method stores a `Registration` in a `Registry`'s `registration` collection and that the collection is specifically an `Array`.

This sort of detail in a test creates dependency in the test on the internal structure of the `object` being tested. This dependency means that if other requirement guide us to change the `Array` to a `Hash`, this test will fail, even though the behaviour of the `object` hasn't changed. This is the primary reason for test suites to become ignored and, ultimately, discarded.

So if testing internals of an `object` is counterproductive in the long run, what should we focus on when we write these first?

The problem with testing an `object`'s internal structure is that we're testing what an `object` is instead of what it does. What an `object` does is significantly more important.

The same is true at the applicatin level. Stakeholders don't usually care that data is being persisted in an ANSI-compliant, relational database. They care that it's in "the database", but even then, they generally mean is that it's stored somewhere and they can get it back.

`BDD` puts the focus back on behaviour instead of structure, and it does so at every level of development. Whether we're talking about an `object` calculating the distance between two cities, another `object` delegating a search off to a third-party service, or a user-facing screen providing feedback when we provide invalid input, it's all behaviour!

Once we acknowledge this, it changes the way we think about driving out code. We begin to think more about interactions between people and systems, or between `objects`, than we do about the structure of the `objects`.

We believe that most of the problems that software development teams face are communication problems. `BDD` aims to help communication by simplifying the language we use to describe scenarios in which the software will be used: `Given` some context, `When` some even occurs, `Then` I expect some outcome.

`Given`, `When`, `Then`, the `BDD` triad, are simple words that we use whether we're talking about application behaviour or `object` behaviour. They are easily understood by business analysts, testers, and developers alike.


....for specifying application behaviour, we want something that communicates in broader strokes. And for that, we use `Cucumber`.

We use `Cucumber` to describe the behaviour of application and use `RSpec` to describe the behaviour of `objects`. With the addition of a higher-level tool like `Cucumber`, we'll actually have two concentric `red/green/refactor cycles`, as depicted in Figure 1.1(`MSpec = RSpec` and `SpecFlow` = `Cucumber`):

![figure-1.1](bddcycle.jpg)

### Chapter 2 Hello

1. Crated file called `butler_spec.rb` with it's contents then make a directory called `spec` and move `butler_spec.rb` under it like so `spec/butler_spec`.

<pre><code>
$ <b>rspec butler_spec.rb</b>
1 deprecation warning total

Finished in 0.00889 seconds (files took 0.20208 seconds to load)
1 example, 0 failures
</pre></code>

2. Make a directory called `features` then create a file called `butler_says_hello.feature` with it's contents and move it under `features` like so `features/butler_says_hello.feature`

<pre><code>
$ <b>cucumber features</b>
Feature: butler says hello
  In order to start learning RSpec and Cucumber
  As a reader of the RSpec Book
  I want a butler to say Hello

  Scenario: butler says hello           # features/butler_says_hello.feature:7
    Given a butler                      # features/butler_says_hello.feature:8
    When I send it the greet message    # features/butler_says_hello.feature:9
    Then I should see "Hello Cucumber!" # features/butler_says_hello.feature:10

1 scenario (1 undefined)
3 steps (3 undefined)
0m0.050s

You can implement step definitions for undefined steps with these snippets:

Given("a butler") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I send it the greet message") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
</pre></code>

3. To get the `scenario` to pass we need to store `step definitions` in a file that `Cucumber` can load. Go ahead and add a `step_definitions` directory under `features` like so `features/step_definitions`, and add a file named `butler_steps.rb` with the code snippets from above. Make sure to write code that turns the phrase above into concrete actions.

4. Run the `$ cucumebr features` again:
<pre><code>
$ <b>cucumebr features</b>
Feature: butler says hello
  In order to start learning RSpec and Cucumber
  As a reader of the RSpec Book
  I want a butler to say Hello

  Scenario: butler says hello           # features/butler_says_hello.feature:7
    Given a butler                      # features/step_definitions/butler_steps.rb:1
      uninitialized constant CucumberButler
      Did you mean?  Cucumber (NameError)
      ./features/step_definitions/butler_steps.rb:2:in `"a butler"'
      features/butler_says_hello.feature:8:in `Given a butler'
    When I send it the greet message    # features/step_definitions/butler_steps.rb:5
    Then I should see "Hello Cucumber!" # features/step_definitions/butler_steps.rb:9

Failing Scenarios:
cucumber features/butler_says_hello.feature:7 # Scenario: butler says hello

1 scenario (1 failed)
3 steps (1 failed, 2 skipped)
0m0.063s
</pre></code>

To keep it simple add the necessary code inside `features/step_definitions/butler_steps.rb` to pass all the test.

5. Run the `$ cucumebr features` again:
<pre><code>
$ <b>cucumebr features</b>
Feature: butler says hello
  In order to start learning RSpec and Cucumber
  As a reader of the RSpec Book
  I want a butler to say Hello

  Scenario: butler says hello           # features/butler_says_hello.feature:7
    Given a butler                      # features/step_definitions/butler_steps.rb:7
    When I send it the greet message    # features/step_definitions/butler_steps.rb:11
DEPRECATION: Using `should` from rspec-expectations' old `:should` syntax without explicitly enabling the syntax is deprecated. Use the new :expect` syntax or explicitly enable `:should` with `config.expect_with(:rspec) { |c| c.syntax = :should }` instead. Called from /Users/mikaelblomkvist/the-rspec-book/GettingStartedWithRSpecAndCucumber/ch2-hello/features/step_definitions/butler_steps.rb:16:in `block in <top (required)>'.
    Then I should see "Hello Cucumber!" # features/step_definitions/butler_steps.rb:15

1 scenario (1 passed)
3 steps (3 passed)
0m0.047s
</pre></code>

###  Chapter 3 Describing Features

....The plus signs for the exact matches always come before the minus signs for the number matches and don't align with specific positions in the guess or the secret code.

....We want to avoid the pitfalls of the Big Design Up Front, but we also want to do enough planning to know we're heading in the right direction. ....picking out user stories for our first iteration.

....A great way to get started gathering user stories is to do a high-level brain dump of the sorts of things we might like to do. Here are some titles to get started:

* Code-breaker starts game
* Code-breaker submits guess
* Code-breaker wins game
* Code-breaker loses game
* Code-breaker plays again
* Code-breaker requests hint
* Code-breaker saves score

See how each of these is phrased as role + action? The role is the code-breaker role each time because this game has only one kind of user. In other applications, we might have several different kinds of users, in which case we want to express stories in terms of a specific role (not just a generic user), because that impacts how we think about each requirement and why we're implementing code to satisfy it.

These are also high level and don't tell us much about how the system should respond to these actions. Let's take titles and generate some user stories from them.

**Code-breaker starts game** The code-breaker opens a shell, types a command, and sees a welcome message and a prompt to enter the first guess.

**Code-breaker submits guess** The code-breaker enters the guess, and the system replies by marking the guess according to the marking algorithm.

**Code-breaker wins game** The code-breaker enters a guess that matches the secret code exactly. The system responds by marking  the guess with four + signs and a message congratulating the code-breaker on breaking the code in however many guesses it took.

**Code-breaker plays again** After the game is won or lost, the system prompts the code-breaker to play again. If the code-breaker indicates yes, a new game begins. If the code-breaker indicates no, the system shuts down.

**Code-breaker request hint** At any time during the game, the code-breaker can request a hint, at which point the system reveals one of the numbers in the secret code.

**Code-breaker saves score** After the game is won or lost, the code-breaker can opt to save information about the game: who (initials?), how many turns, and so on.

We can already see some of the challenges ahead: "according to the marking algorithm" is going to require some conversation with the stakeholders. In fact, this is where we'll spend the majority of our time both planning and developing, because the marking algorithm is where much of the complexity lies.

Note the deliberate lack of detail and even some open questions. We'll get into some detail as we choose which of these stories we want to include in the release, and then we'll get more detailed in each iteration within the release. But at each phase, we want to do just enough planning to keep on moving, and no more.

Now that we have some stories, let's consider them in the context of the stated goal for the initial release: to simply be able to play the game, Looking at the original list of stories, there are only two that are absolutely necessary to meet that goal:
* Code-breaker starts game
* Code-breaker submits guess

We definitely have to be able to start the game somehow so that one is a no-brainer. Once we've started the game, if we can submit a guess and get the mark, then we can submit more guesses. As soon as we get a perfect mark, the game is won, and we hit `Ctrl + C` to stop the game and start the game back up to play again. What do you think? I agree I wouldn't add any more stories for the initial release :)

....Wait, wait, wait! We're heading down a slippery slope here. Pretty soon we'll be including our entire backlog of stoires in the first release! Let's step back for a second. What is the release goal? To be able to play the game.

....Given this context, we'll go with Code-breaker starts the game and Code-breaker submits guess. Together, those two stories should suffice to get us to the point where we can play the game--unless, of course, we're missing something.

It turns out that there is one feature of the game that we haven't discussed yet! We won't really see the evidence of it until we submit a guess and the game marks it. Can you guess what it is? Think about how the game will be able to mark the guess. It has to mark it against something, right?

The **secret code**!

The game will need to generate a **secret code** that is different every time in order for it to be truly enjoyable. Now is this a user story? This is one of those grey areas that challenges the boundaries of what a user story is. Ask one experienced XPer, and you'll hear that this is really part of the **Code-breaker starts game** story based on the idea that the **secret code** should be generated when the game starts.

The next person might argue it's really part of the **Code-breaker submits guess** story because that's the first time the user gets any feedback from the system that depends on the guess.

We're going to take third stance and make it a seperate story based on practicality. ...we want to keep things small enough to accomplish in a reasonable amount of time so we can check things off the list as we go. Does that sound selfish?

....Absolutely not! we're just planing! And user stories are, above all else, a planning tool. Although you can find many definitions of what a user story is and therefore must be in order to earn the title, here is a simple set of criteria that David learned from Bob Koss at Object Mentor. A user story must have the following characteristics:

**Have a business value** Clearly, the game is no fun unless it generates a different secret code each time.

**Be testable** That's easy. We just start up a bunch of games and ask for the code. As you'll see when we develop this part, this reveals some interesting questions about designing for testability.

**Be small enough to implement in one iteration** This is the motivation for separating this story. It's guidelines that allows us to balance implementation concerns with requirements.

So, now we have our release plan with three stories. It's time to start breaking down into iterations.

....Cucumber features have three parts: a title, a brief narrative(conextra format narrative or free-form narrative), and an arbitrary number of scenarios that serve as acceptance criteria.

1. Make a directory called `features` then create a new file under it called `codebreaker_starts_game.feature` so it looks like `features/codebreaker_starts_game.feature`. Copy the content of the feature, shown earlier.

2. Make a directory called `support`, under `features` then create a new file called `env.rb` so it looks like `features/support/env.rb`. Even though we will leave this empty for now, `Cucumber` needs this file (or any `.rb` file) in order to know that we're using Ruby.

3. Create a new file under `features` called `codebreaker_submits_guess.feature` so it looks like `features/codebreaker_submits_guess.feature`. Add Copy the content of the feature, shown earlier.

### Chapter 4  Automating Features with Cucumber
