# require 'pry-byebug'

directions_string = File.open("#{__dir__}/data.txt").read

puts
puts '*** Count visited houses ***'
puts

def count_visited_houses(directions_string)
  x = 0; y = 0
  visit_registry = { 'x0y0' => '*' }

  directions_string.split('').each do |char|
    case char
    when '^'
      y += 1
    when '>'
      x += 1
    when 'v'
      y -= 1
    when '<'
      x -= 1
    end

    visit_registry["x#{x}y#{y}"] = '*'
  end

  visit_registry.keys.count
end

puts "Expect #{count_visited_houses('>')} to eq 2"
puts "Expect #{count_visited_houses('^>v<')} to eq 4"
puts "Expect #{count_visited_houses('^v^v^v^v^v')} to eq 2"
puts
puts "Count visited houses: #{count_visited_houses(directions_string)}"
puts

puts
puts '*** Count visited houses with Robot Santa ***'
puts

def count_visited_houses_with_robot(directions_string)
  x = 0; y = 0; robot_x = 0; robot_y = 0
  visit_registry = { 'x0y0' => '*' }

  directions_string.split('').each_with_index do |char, index|
    if index.even?
      case char
      when '^'
        y += 1
      when '>'
        x += 1
      when 'v'
        y -= 1
      when '<'
        x -= 1
      end
    else
      case char
      when '^'
        robot_y += 1
      when '>'
        robot_x += 1
      when 'v'
        robot_y -= 1
      when '<'
        robot_x -= 1
      end
    end

    visit_registry["x#{x}y#{y}"] = '*'
    visit_registry["x#{robot_x}y#{robot_y}"] = '*'
  end

  visit_registry.keys.count
end

puts "Expect #{count_visited_houses_with_robot('^v')} to eq 3"
puts "Expect #{count_visited_houses_with_robot('^>v<')} to eq 3"
puts "Expect #{count_visited_houses_with_robot('^v^v^v^v^v')} to eq 11"
puts
puts "Count visited houses with Robot Santa: #{count_visited_houses_with_robot(directions_string)}"
puts
