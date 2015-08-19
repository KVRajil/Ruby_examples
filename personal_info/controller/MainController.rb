require 'erb'
class MainController
	attr_accessor :session,:status
	def initialize(id,parameter,session)
		@id=id
		@parameter = parameter
		@session = session
	end
	def redirect_to(path)
    @redirect = [301, {'Location' => path, 'Cache-Control' => 'no-cache'}, []]
  end

	def render(template)
		path=File.expand_path("../../views/#{self.class.to_s.downcase.sub("controller","")}/#{template}.html.erb",__FILE__)
		ERB.new(File.read(path)).result(binding)
	end

end
