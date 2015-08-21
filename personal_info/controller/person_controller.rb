load './controller/MainController.rb'
load './model/person_info.rb'

class PersonController < MainController
	 def initialize(id,parameter,session)
		 @id = id
		 @parameter = parameter
		 @session = session
	 end
	 def show
		 begin
			 	@user = PersonInfo.find_by_id(@id)
				render "userinfo"
		 rescue
			  notfound()
		 end
   end

	 def index

		 unless(@session[:id].nil?)
			 render "index"
		 else
			 redirect_to("/login")
		 end
	 end

	 def notfound
		 render "notfound"
	 end


end
