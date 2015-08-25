load './controller/MainController.rb'
load './model/person_info.rb'
require 'digest/md5'
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
		@person.password = Digest::MD5.hexdigest(@parameter['password'])
		if @person.valid?
			 @person.save
			 login()
		else
			@errors = @person.errors.full_messages
			register()
		end
	end
	def signin
		@person = PersonInfo.find_by_username(@parameter['username'])
		@parameter['password'] = Digest::MD5.hexdigest(@parameter['password'])
  	if @person && @person.password == @parameter['password']
			@session[:id] = @person.id
			puts "instance #{@session[:id]}"
			redirect_to "/"
		else
			@errors = "invalid username or password"
			login()
		end
	end

	def logout
		@session.delete("id")
		login()
	end


end
