# require 'pry-byebug'

puts
puts '*** Nice or naughty strings ***'
puts

def nice?(input_string)
  # occurrences of any of a, e, i, o, u
  return false if input_string.scan(/[aeiou]/).size < 3
  
  # matches any character and its repetition (\1 => backreference to first matching group)
  return false if input_string.match(/(.)\1/).nil?
  
  # matches ab OR cd OR /..
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

puts
puts '*** Nice or naughty strings - revised ***'
puts

def revised_nice?(input_string)
  # matches any group of 2 characters and its repetition with any number of any characters in the middle
  return false if input_string.match(/(.{2}).*\1/).nil?
  # matches any character and its repetition with any one character in the middle
  return false if input_string.match(/(.).\1/).nil?

  true
end

def revised_nice_strings_count(strings_file_name)
  count = 0

  File.open(strings_file_name).each do |line|
    count += 1 if revised_nice?(line)
  end

  count
end

puts "Expect #{revised_nice?('qjhvhtzxzqqjkmpb')} to be true"
puts "Expect #{revised_nice?('xxyxx')} to be true"
puts "Expect #{revised_nice?('uurcxstgmygtbstg')} to be false"
puts "Expect #{revised_nice?('ieodomkazucvgmuy')} to be false"
puts
puts "Nice strings number: #{revised_nice_strings_count("#{__dir__}/data.txt")}"
puts
