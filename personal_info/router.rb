

class Router


    def self.call(path,req_method,parameter,session)
      @path = path
      @req_methods =req_method
      @parameter = parameter
      @session = session
      @controller,@action,@id = url_parser(@path)
      obj,action = als_load(@controller,@action,@id)
    end

    def self.url_parser(path)
      case path
        when /^\/$/
          ['person','index',1]
        when /^\/index$/
          ['person','index',1]
        when /^\/person\/([0-9]+)$/
          ['person','show',"#{$1}"]
        when /^\/login$/
            ['session','login',1]
        when /^\/logout$/
            ['session','logout',1]
        when /^\/register$/
          ['session','register',1]
        when /^\/create$/
            ['session','create',1]
        when /^\/signin$/
            ['session','signin',1]
        else
            ['person','notfound',1]

      end
    end

    def self.als_load(controller,action,id)
    		controller_file="./controller/"+controller+"_controller.rb"
    		load controller_file
    		class_name=controller.capitalize+"Controller"
        ob = Module.const_get(class_name).new(id,@parameter,@session)
        [ob,action]
  	end

end
