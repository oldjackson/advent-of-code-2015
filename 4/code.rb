require 'digest'
# require 'pry-byebug'

puts
puts '*** Smallest integer yielding a MD5 hash starting with a given number of zeros ***'
puts

def smallest_zero_md5_integer(input_string, number_of_zeros)
  n = 1
  n += 1 while Digest::MD5.hexdigest("#{input_string}#{n}").match(/^0{#{number_of_zeros}}/).nil?

  n
end

puts "Expect #{smallest_zero_md5_integer('abcdef', 5)} to eq 609043"
puts "Expect #{smallest_zero_md5_integer('pqrstuv', 5)} to eq 1048970"
puts
puts "Smallest integer giving MD5 hash starting with 5 zeros : #{smallest_zero_md5_integer('ckczppom', 5)}"
puts "Smallest integer giving MD5 hash starting with 6 zeros : #{smallest_zero_md5_integer('ckczppom', 6)}"
puts
