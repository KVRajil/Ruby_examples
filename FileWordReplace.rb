file = File.open("input.txt", "r")
contents = file.read
puts "Enter String to be replaced "
inputString=gets().chomp
puts "Enter new String "
newString=gets().chomp

fileModified=contents.gsub(/#{inputString}/,newString)

puts fileModified

File.open("input.txt", 'w') { |file| file.write(fileModified) }



