class Replacer

  def string_replcaer! (file_content, match_string, replace_string)
    modified_content = file_content.gsub(/#{match_string}/,replace_string)
    if(modified_content==file_content)
      puts "no matching word found"
      exit
    else
      return modified_content
    end

  end

end
