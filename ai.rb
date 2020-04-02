module Ai
  def ai_guess()#black and white are from last turn. 
    guess = ""
    for i in 1..4
      guess += rand(1..6).to_s
      
    end
    guess
  end
end
