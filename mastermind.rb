class Game
  attr_reader :turn
  def initialize()
    mode, @max_turns = choose_settings()
    @codemaker = Codemaker.new(mode)
    @board = Board.new(@codemaker.code)
    @guesser = Guesser.new(mode) #true for ai, false for player
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
      return @turn
    else
      puts "BLACK: #{black}\nWHITE: #{white}"
    end
    @turn += 1
  end
  def over?()
    if @turn > @max_turns
      puts "Codemaker have WON!!!"
      return true
    elsif @game_over == true 
      puts "Guesser have WON!!!"
      return true
    end
    false
  end
  def choose_settings
    puts "Do you want to be the guesser or codemaker?"
    mode = gets.chomp
    puts "Enter number of max turns"
    turns = gets.chomp.to_i
    [mode[0], turns]
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
  require_relative 'ai.rb'
  include Ai
  def initialize(mode)
    @mode = mode
  end
  def guess()
    if @mode == "g"
      guess = player_guess
    else
      guess = ai_guess() #Uses ai.rb file.
    end
    guess
  end 
  private
  def player_guess()
    puts "Make your guess: "
    gets.chomp
  end
end
class Codemaker
  attr_reader :code
  def initialize(mode)
    @mode = mode
    @code = create_code()
    puts @code
  end
  private
  def create_code() #if I want comp generated. 
    code_string = ""
    if @mode == "c"
      code_colored(code_string)
    else
      for i in 1..4
        code_string += rand(1..6).to_s
      end
    end 
    code_string
  end
  def player_input()
    valid_input = false
    while valid_input == false
      puts "Enter code: "
      code_string = gets.chomp
      if code_string == code_string[/[1-6]{4}/]
        valid_input = true
      end
    end
  end
end

game = Game.new()
while !game.over?()
  game.play_round
end
