load './controller/MainController.rb'
load './model/person_info.rb'
class SessionController < MainController
	def initialize(id,parameter,session)
		@id = id
		@parameter = parameter
		@session = session
	end
  def login
		render "login"
	end

	def register
		render "register"
	end

	def create
		@person = PersonInfo.new(@parameter)
		if @person.valid?
			 @person.save
		else
			@errors = @person.errors.full_messages
			register()
		end
	end
	def signin
		@person = PersonInfo.find_by_username(@parameter['username'])
  	if @person && @person.password == @parameter['password']
			@session[:id] = @person.id
			puts @session[:id]
			redirect_to "/"
		else
			@errors = "invalid username or password"
			login()
		end
	end

	def logout
		@session[:id]=nil
	end


end
