<pre><code>
$ <b>rvm use 2.4.1@GettingStartedWithRSpecAndCucumber --create</b>
ruby-2.4.1 - #gemset created /Users/mikaelblomkvist/.rvm/gems/ruby-2.4.1@GettingStartedWithRSpecAndCucumber
ruby-2.4.1 - #generating GettingStartedWithRSpecAndCucumber wrappers..........
Using /Users/mikaelblomkvist/.rvm/gems/ruby-2.4.1 with gemset GettingStartedWithRSpecAndCucumber

$ <b>gem list</b>

*** LOCAL GEMS ***

bigdecimal (default: 1.3.0)
bundler-unload (1.0.2)
did_you_mean (1.1.0)
executable-hooks (1.4.2)
gem-wrappers (1.3.2)
io-console (default: 0.4.6)
json (default: 2.0.2)
minitest (5.10.1)
net-telnet (0.1.1)
openssl (default: 2.0.3)
power_assert (0.4.1)
psych (default: 2.2.2)
rake (12.0.0)
rdoc (default: 5.0.0)
rubygems-bundler (1.4.4)
rvm (1.11.3.9)
test-unit (3.2.3)
xmlrpc (0.2.1)
</pre></code>

<pre><code>
$ <b>gem install rspec --no-ri --no-rdoc</b>
Fetching: rspec-support-3.7.1.gem (100%)
Successfully installed rspec-support-3.7.1
Fetching: rspec-core-3.7.1.gem (100%)
Successfully installed rspec-core-3.7.1
Fetching: diff-lcs-1.3.gem (100%)
Successfully installed diff-lcs-1.3
Fetching: rspec-expectations-3.7.0.gem (100%)
Successfully installed rspec-expectations-3.7.0
Fetching: rspec-mocks-3.7.0.gem (100%)
Successfully installed rspec-mocks-3.7.0
Fetching: rspec-3.7.0.gem (100%)
Successfully installed rspec-3.7.0
6 gems installed
</pre></code>

<pre><code>
$ <b>gem install cucumber --no-ri --no-rdoc</b>
Fetching: gherkin-5.0.0.gem (100%)
Successfully installed gherkin-5.0.0
Fetching: cucumber-tag_expressions-1.1.1.gem (100%)
Successfully installed cucumber-tag_expressions-1.1.1
Fetching: backports-3.11.3.gem (100%)
Successfully installed backports-3.11.3
Fetching: cucumber-core-3.1.0.gem (100%)
Successfully installed cucumber-core-3.1.0
Fetching: builder-3.2.3.gem (100%)
Successfully installed builder-3.2.3
Fetching: multi_json-1.13.1.gem (100%)
Successfully installed multi_json-1.13.1
Fetching: multi_test-0.1.2.gem (100%)
Successfully installed multi_test-0.1.2
Fetching: cucumber-wire-0.0.1.gem (100%)
Successfully installed cucumber-wire-0.0.1
Fetching: cucumber-expressions-5.0.18.gem (100%)
Successfully installed cucumber-expressions-5.0.18
Fetching: cucumber-3.1.0.gem (100%)
Successfully installed cucumber-3.1.0
10 gems installed
</pre></code>

<pre><code>
$ <b>gem list</b>

*** LOCAL GEMS ***

backports (3.11.3)
bigdecimal (default: 1.3.0)
builder (3.2.3)
bundler-unload (1.0.2)
cucumber (3.1.0)
cucumber-core (3.1.0)
cucumber-expressions (5.0.18)
cucumber-tag_expressions (1.1.1)
cucumber-wire (0.0.1)
did_you_mean (1.1.0)
diff-lcs (1.3)
executable-hooks (1.4.2)
gem-wrappers (1.3.2)
gherkin (5.0.0)
io-console (default: 0.4.6)
json (default: 2.0.2)
minitest (5.10.1)
multi_json (1.13.1)
multi_test (0.1.2)
net-telnet (0.1.1)
openssl (default: 2.0.3)
power_assert (0.4.1)
psych (default: 2.2.2)
rake (12.0.0)
rdoc (default: 5.0.0)
rspec (3.7.0)
rspec-core (3.7.1)
rspec-expectations (3.7.0)
rspec-mocks (3.7.0)
rspec-support (3.7.1)
rubygems-bundler (1.4.4)
rvm (1.11.3.9)
test-unit (3.2.3)
xmlrpc (0.2.1)
</pre></code>
