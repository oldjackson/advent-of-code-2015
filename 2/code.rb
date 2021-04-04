# require 'pry-byebug'

puts
puts '*** Wrapping paper surface ***'
puts

def wrapping_paper_surface(box_sizes_file_name)
  surface = 0

  File.open(box_sizes_file_name).each do |line|
    sorted_sizes = line.split('x').map(&:to_i).sort

    surface += (3 * sorted_sizes[0] * sorted_sizes[1] +
      2 * sorted_sizes[2] * sorted_sizes[1] +
      2 * sorted_sizes[0] * sorted_sizes[2])
  end

  surface
end

puts "Expect #{wrapping_paper_surface("#{__dir__}/test_data.txt")} to eq 4473"
puts
puts "Total surface: #{wrapping_paper_surface("#{__dir__}/data.txt")}"
puts

puts '*** Ribbon length ***'
puts

def ribbon_length(box_sizes_file_name)
  length = 0

  File.open(box_sizes_file_name).each do |line|
    sorted_sizes = line.split('x').map(&:to_i).sort

    length += (2 * (sorted_sizes[0] + sorted_sizes[1]) +
      sorted_sizes[2] * sorted_sizes[1] * sorted_sizes[0])
  end

  length
end

puts "Expect #{ribbon_length("#{__dir__}/test_data.txt")} to eq 11369"
puts
puts "Total length: #{ribbon_length("#{__dir__}/data.txt")}"
puts