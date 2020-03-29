module Helper
  def code_colored(code)
    array = code.to_s.chars.map{|char|char.to_i} 
    array.each do |a|
      print " ".bg_red     + "1".red     + " ".bg_red     + " "  if a == 1
      print " ".bg_green   + "2".green   + " ".bg_green   + " "  if a == 2
      print " ".bg_blue    + "3".blue    + " ".bg_blue    + " "  if a == 3
      print " ".bg_orange  + "4".orange  + " ".bg_orange  + " "  if a == 4
      print " ".bg_cyan    + "5".cyan    + " ".bg_cyan    + " "  if a == 5
      print " ".bg_magenta + "6".magenta + " ".bg_magenta + " "  if a == 6
    end
    puts ""
  end
  def guide_color()
    puts "1 for red.    ".bg_red
    puts "2 for green.  ".bg_green
    puts "3 for blue.   ".bg_blue
    puts "4 for orange. ".bg_orange
    puts "5 for cyan.   ".bg_cyan
    puts "6 for magenta.".bg_magenta
  end
  def to_arr(string)
    string.to_s.chars.map{|char|char.to_i}
  end
end
class String
  def red;        "\033[31m#{self}\033[0m" end
  def green;      "\033[32m#{self}\033[0m" end
  def orange;     "\033[33m#{self}\033[0m" end
  def blue;       "\033[34m#{self}\033[0m" end
  def magenta;    "\033[35m#{self}\033[0m" end
  def cyan;       "\033[36m#{self}\033[0m" end
  
  def bg_red;     "\e[41m#{self}\e[0m" end
  def bg_green;   "\e[42m#{self}\e[0m" end
  def bg_orange;  "\e[43m#{self}\e[0m" end
  def bg_blue;    "\e[44m#{self}\e[0m" end
  def bg_magenta; "\e[45m#{self}\e[0m" end
  def bg_cyan;    "\e[46m#{self}\e[0m" end
  def bg_gray;    "\e[47m#{self}\e[0m" end
end
