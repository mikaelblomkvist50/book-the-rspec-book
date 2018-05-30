# Talking Directory Structure

Many coding technical books I've encountered seem to talk about the `directory structure` that will be used in the project covered through out the book. As well as other available `directory structures` you may encounter in the open source/industry. Hence I've dedicated a file to highlight/outline the `directory structure` demonstrated in this book. Who knows maybe by documenting this fo each book I complete, I'll start to notice a pattern, or even see benefits or maybe criticism.

---

To get going, create a `spec` directory, with a subdirectory named `code-breaker`. Now create a file named `game_spec.rb` in `spec/codebreaker/`. As we progress, we'll maintain  parallel structure like this in which source file (for example, `lib/codebreaker/game.rb`) has a parallel spec file (for exmaple, `spec/codebreaker/game.rb`). -- *"The RSpec Book" Version: 2011-4-7, The Pragmatic Programmers (Chapter 5. Describing Code with RSpec)*

---

Perhaps you're heard that a `one-to-one mapping` between `objects` and their specs is a `BDD` no-no. There is some truth to this, but the devil is in the details.

We want to avoid a strict adherence to a structure in which every `object` has a single example group and every `method` has a single code example. That sort of structure leads to long examples that take an object through many phases, setting expectations  at several stopping points in each example, Examples like these are difficult to write to begin with and much more difficult to understand and debug later.

A `one-to-one mapping` of spec-file to application-code-file, however, is not only perfectly fine but actually beneficial. It makes it easier to understand where to find the specs for code you might be looking at. It also makes it easier for tools to automate shortcuts like the one in the `RSpec TextMate` bundle, which switches between spec-file and application code with `Ctrl+Shift+Down`. -- *"The RSpec Book" Version: 2011-4-7, The Pragmatic Programmers (Chapter 5. Describing Code with RSpec)*
