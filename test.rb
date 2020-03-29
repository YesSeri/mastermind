  def evaluate_guess(guess)
    @code = 2324
    black, white = 0, 0
    code_arr, guess_arr = to_arr(@code), to_arr(guess)
    index_to_delete = []
    for i in (code_arr.length-1).downto(0)
      puts i
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
