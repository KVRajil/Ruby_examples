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
			 	unless(@session[:id].nil?)
					@user = PersonInfo.find_by_id(@id)
  				render "userinfo"
	 		 else
	 			 redirect_to("/login")
	 		 end
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
