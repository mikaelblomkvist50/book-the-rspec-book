module Codebreaker
  class Game
    def initialize(output) #output=> #<IO:<STDOUT>>
      binding.pry
      @output = output #@output=> #<IO:<STDOUT>>
      binding.pry
    end

    def start
      @output.puts 'Welcome to Codebreaker!' #=> STDOUT.puts 'Welcome to Codebraeker!'
      @output.puts 'Enter guess:' #=> STDOUT.puts 'Enter guess:'
    end
  end
end
