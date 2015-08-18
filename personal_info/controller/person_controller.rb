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
		 Person_info.all.each do |user|
			 puts user.username
		 end
	 end



end
