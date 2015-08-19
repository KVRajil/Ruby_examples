require_relative 'replacer'
require_relative 'fileop'
require_relative 'inputdata'

TEXT_FILE = 'input.txt'

class Main

  def file_replace_op

    input_data = InputData.new
    match = input_data.get_match_string
    input_data.check_input(match)
    replace = input_data.get_replace_string
    input_data.check_input(replace)

    file_object = FileOP.new
    file_content = file_object.file_read(TEXT_FILE)

    replacer = Replacer.new
    modified = replacer.string_replcaer!(file_content, match, replace)

    file_object.file_write(TEXT_FILE, modified)
    input_data.success_message

  end

end


operation = Main.new
operation.file_replace_op
