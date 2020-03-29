class Game
  def initialize()
    @codemaker = Codemaker.new()
    @board = Board.new(@codemaker.code)
    @guesser = Guesser.new()
    @game_over = false
    @turn = 1
  end
  def play_round
    puts "Turn: #{@turn}"
    guess = @guesser.guess()
    @board.colorize(guess)
    black, white = @board.evaluate_guess(guess)
    if black == 4
      @game_over = true
    else
      puts "BLACK: #{black}\nWHITE: #{white}"
    end
    @turn += 1
  end
  def over?()
    if @turn > 10  
      puts "You have LOST!!!"
      return true
    elsif @game_over == true 
      puts "You have WON!!!"
      return true
    end
    false
  end
end
class Board
  require_relative 'helper.rb'
  include Helper
  def initialize(code)
    @code = code
    print_guide()
  end
  def evaluate_guess(guess)
    black, white = 0, 0
    code_arr, guess_arr = to_arr(@code), to_arr(guess)
    index_to_delete = []
    for i in (code_arr.length-1).downto(0)
      if code_arr[i] == guess_arr[i]
        black += 1
	code_arr.delete_at(i)
	guess_arr.delete_at(i)
      end
    end
    guess_arr.each do |c|
      i = code_arr.index(c)
      code_arr.delete_at(i) if i
    end
    white = guess_arr.length - code_arr.length
  return black, white 
  end
  def colorize(string)
    code_colored(string)
  end
  private
  def print_guide()
    guide_color()
  end
end
class Guesser
  def initialize()
  end
  def guess()
    puts "Make your guess: "
    gets.chomp
  end  
end
class Codemaker
  attr_reader :code
  def initialize()
    @code = create_code()
  end
  def create_code() #if I want comp generated. 
    code_string = ""
    for i in 1..4
      code_string += rand(1..6).to_s
    end
    code_string
  end
end
puts "-----START-----"
game = Game.new()
while !game.over?()
  game.play_round
end
puts "------END------"
