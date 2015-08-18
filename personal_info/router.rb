

class Router


    def self.call(path,req_method,parameter)
      @path = path
      @req_methods =req_method
      @parameter = parameter
      @controller,@action,@id = url_parser(@path)
      obj = als_load(@controller,@action,@id)
    end

    def self.url_parser(path)
      case path
        when /^\/$/
          ['person','index',1]
        when /^\/person\/([0-9]+)$/
          ['person','show',"#{$1}"]
        when /^\/login$/
            ['session','login',1]
        when /^\/register$/
          ['session','register',1]
        when /^\/create$/
            ['session','create',1]
        when /^\/signin$/
            ['session','signin',1]

      end
    end

    def self.als_load(controller,action,id)
    		controller_file="./controller/"+controller+"_controller.rb"
    		load controller_file
    		class_name=controller.capitalize+"Controller"
        ob = Module.const_get(class_name).new(id,@parameter)
        ob.send(action)
  	end

end
