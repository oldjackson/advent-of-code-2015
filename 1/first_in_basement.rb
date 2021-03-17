def first_step_in_basement(directions_string)
  floor = 0

  directions_string.split('').each_with_index do |char, index|
    floor += (char == '(' ? 1 : -1)
    return index + 1 if floor == -1
  end
end

puts "Expect #{first_step_in_basement(')')} to eq 1"
puts "Expect #{first_step_in_basement('()())')} to eq 5"

directions_string = File.open('./floor_directions.txt').read
puts "First step in basement: #{first_step_in_basement(directions_string)}"
