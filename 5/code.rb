# require 'pry-byebug'

puts
puts '*** Nice or naughty strings ***'
puts

def nice?(input_string)
  return false if input_string.scan(/[aeiou]/).size < 3
  return false if input_string.match(/(.)\1{1}/).nil?
  return false if input_string.match(/(ab|cd|pq|xy)/)

  true
end

def nice_strings_count(strings_file_name)
  count = 0

  File.open(strings_file_name).each do |line|
    count += 1 if nice?(line)
  end

  count
end

puts "Expect #{nice?('aaa')} to be true"
puts "Expect #{nice?('ugknbfddgicrmopn')} to be true"
puts "Expect #{nice?('jchzalrnumimnmhp')} to be false"
puts "Expect #{nice?('haegwjzuvuyypxyu')} to be false"
puts "Expect #{nice?('dvszwmarrgswjxmb')} to be false"
puts
puts "Nice strings number: #{nice_strings_count("#{__dir__}/data.txt")}"
puts

# puts '*** Ribbon length ***'
# puts

# def ribbon_length(box_sizes_file_name)
#   length = 0

#   File.open(box_sizes_file_name).each do |line|
#     sorted_sizes = line.split('x').map(&:to_i).sort

#     length += (2 * (sorted_sizes[0] + sorted_sizes[1]) +
#       sorted_sizes[2] * sorted_sizes[1] * sorted_sizes[0])
#   end

#   length
# end

# puts "Expect #{ribbon_length("#{__dir__}/test_data.txt")} to eq 11369"
# puts
# puts "Total length: #{ribbon_length("#{__dir__}/data.txt")}"
# puts
