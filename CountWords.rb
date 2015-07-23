
  file = File.open("input.txt", "r")
  contents = file.read
  count=0;
  puts "input string : " + contents
  puts "number of words = #{contents.split(/\S+/).size-1}"
