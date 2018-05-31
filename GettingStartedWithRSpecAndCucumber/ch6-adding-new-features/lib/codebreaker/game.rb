module Codebreaker
  class Game
    def initialize(output) #output=> #<IO:<STDOUT>>
      @output = output #@output=> #<IO:<STDOUT>>
    end

    def start
      @output.puts 'Welcome to Codebreaker!' #=> STDOUT.puts 'Welcome to Codebraeker!'
      @output.puts 'Enter guess:' #=> STDOUT.puts 'Enter guess:'
    end
  end
end
