load './controller/MainController.rb'
load './model/person_info.rb'

class PersonController < MainController
	 def initialize(id,parameter)
		 @id = id
		 @parameter = parameter
	 end
	 def show
		 "hi #{@id}"
	 end

	 def index
		 render "index"
	 end



end
