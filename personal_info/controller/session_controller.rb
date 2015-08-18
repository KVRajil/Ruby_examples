load './controller/MainController.rb'
load './model/person_info.rb'
class SessionController < MainController
	def initialize(id,parameter)
		@id = id
		@parameter = parameter
	end
  def login
		render "login"
	end

	def register
		render "register"
	end

	def create
		@person = PersonInfo.new(@parameter)
		@person.save
	end
	def signin
		@person = PersonInfo.find_by_username(@parameter['username'])
  	if @person && @person.password == @parameter['password']
		"success"
		else
		"error"
		end
	end


end
