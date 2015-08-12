
class InputData
    attr_accessor :match_string, :replace_string

    def get_match_string
      puts "Enter the string to be replaced :"
      @match_string = gets.chomp
    end

    def get_replace_string
      puts "Enter new string :"
      @replace_string = gets.chomp
    end

    def check_input (input)
      if input.size==0
        puts "Empty string"
        exit
      end
    end

    def success_message
      puts "words replaced successfully"
    end
end
