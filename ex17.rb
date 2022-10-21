from_file, to_file = ARGV

puts "copying from #{from_file} to #{to_file}"

# we could do these two on one line, how?
indata = open(from_file).read

puts "The input file is #{indata.length} byte long."

puts "Does the output file exist? #{File.exist?(to_file)}"
puts 'Ready, hit RETURN to continue, CTRL-C to abort.'
$stdin.gets

out_file = open(to_file, 'w')
out_file.write(indata)

puts 'Alright, All done.'

out_file.close
