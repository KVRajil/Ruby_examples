


inputString = Array.new
puts "Enter Input STring"
inputString=gets()
puts(inputString)

flag=0
length=inputString.length-1
puts(length)

left=0
right=length-1
mid=length/2

while mid >= 0 do
   if( inputString[left]!=inputString[right]) 
      flag=1
      break
   end
   
   mid=mid-1
   left=left+1
   right=right-1 
  
  
end

if(flag==1)
  puts("not palidrome")

else
  puts("palidrome")
end

