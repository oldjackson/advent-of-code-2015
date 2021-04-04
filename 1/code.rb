# require 'pry-byebug'

directions_string = File.open("#{__dir__}/data.txt").read

puts
puts '*** First step in basement ***'
puts

def first_step_in_basement(directions_string)
  floor = 0

  directions_string.split('').each_with_index do |char, index|
    floor += (char == '(' ? 1 : -1)
    return index + 1 if floor == -1
  end
end

puts "Expect #{first_step_in_basement(')')} to eq 1"
puts "Expect #{first_step_in_basement('()())')} to eq 5"
puts
puts "First step in basement: #{first_step_in_basement(directions_string)}"
puts

puts '*** Floor count ***'
puts

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
puts
puts "Final floor: #{floor_count(directions_string)}"
puts
