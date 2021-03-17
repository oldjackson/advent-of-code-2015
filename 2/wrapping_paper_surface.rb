def wrapping_paper_surface(box_sizes_file_name)
  surface = 0

  File.open(box_sizes_file_name).each do |line|
    sizes = line.split('x').map(&:to_i)

    sorted_sizes = sizes.sort

    surface += (3 * sorted_sizes[0] * sorted_sizes[1] +
      2 * sorted_sizes[2] * sorted_sizes[1] +
      2 * sorted_sizes[0] * sorted_sizes[2])
  end

  surface
end

puts "Expect #{wrapping_paper_surface('./test_box_sizes.txt')} to eq 4473"

puts "Total surface: #{wrapping_paper_surface('./box_sizes.txt')}"
