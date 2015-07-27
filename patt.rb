puts "Enter a string"
inputString=gets().chomp

outPutString=""
ar1 = inputString.scan(/:conditions=>\{(.*?)\}/).join("")
ar2 = inputString.scan(/:joins=>\{(.*?)\}/).join("")
ar3 = inputString.scan(/:select=>\{(.*?)\}/).join("")
ar4 = inputString.scan(/:group=>\{(.*?)\}/).join("")
ar5 = inputString.scan(/:order=>\{(.*?)\}/).join("")
ar6 = inputString.scan(/:having=>\{(.*?)\}/).join("")

if(inputString.match("condition"))
    outPutString+="where("+ar1+")."
end

if(inputString.match("joins"))
    outPutString+="joins("+ar2+")."
end

if(inputString.match("select"))
    outPutString+="select("+ar3+")."
end

if(inputString.match("group"))
    outPutString+="group("+ar4+")."
end

if(inputString.match("order"))
    outPutString+="order("+ar5+")."
end

if(inputString.match("having"))
    outPutString+="having("+ar6+")."
end



puts outPutString.sub!(/.{1}$/,'')