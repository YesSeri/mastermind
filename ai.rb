$i=1
module Ai
  def ai_guess(black, white)#black and white are from last turn. 
    guess = "111#{$i}"
    $i += 1
    $stdout.flush
    sleep(10)
    print guess
    return guess 
  end
end
include Ai
