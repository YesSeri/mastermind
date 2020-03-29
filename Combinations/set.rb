array = []
for a in 1..6
  for b in 1..6
    for c in 1..6
      for d in 1..6
       array << (a.to_s+b.to_s+c.to_s+d.to_s).to_i
      end
    end
  end
end
File.open('output.txt', 'w') do |fo|
  array.each do |a|
    fo.puts a
  end
end
