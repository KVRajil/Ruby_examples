class FileOP

  def file_read (file_name)
      file_exist (file_name)
      file = File.open(file_name, "r")
      file_content = file.read
  end

  def file_write (file_name, modified_content)
      file_exist (file_name)
      File.open(file_name, 'w') { |file| file.write(modified_content) }
  end

  def file_exist (file_name)
    if  !File.exist?(file_name)
      puts "File does not exist"
      exit
    end
  end

end
