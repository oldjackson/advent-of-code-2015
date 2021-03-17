def floor_count(directions_string)
  floor = 0

  directions_string.split('').each do |char|
    floor += (char == '(' ? 1 : -1)
  end

  floor
end

puts "Expect #{floor_count('()()')} to eq 0"
puts "Expect #{floor_count('))(((((')} to eq 3"
puts "Expect #{floor_count(')())())')} to eq -3"

directions_string = File.open('./floor_directions.txt').read
puts "Final floor: #{floor_count(directions_string)}"
