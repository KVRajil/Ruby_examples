

class Router

    def self.call(path,req_method,parameter,session)
      @path = path
      @req_methods =req_method
      @parameter = parameter
      @session = session
      @controller,@action,@id = url_parser(@path)
      obj,action = class_loader(@controller,@action,@id)
    end

    def self.url_parser(path)
      case path
        when /^\/$/
          ['person','index',nil]
        when /^\/index$/
          ['person','index',nil]
        when /^\/person\/([0-9]+)$/
          ['person','show',"#{$1}"]
        when /^\/login$/
            ['session','login',nil]
        when /^\/logout$/
            ['session','logout',nil]
        when /^\/register$/
          ['session','register',nil]
        when /^\/create$/
            ['session','create',nil]
        when /^\/signin$/
            ['session','signin',nil]
        else
            ['person','notfound',nil]

      end
    end

    def self.class_loader(controller,action,id)
    		controller_file="./controller/"+controller+"_controller.rb"
    		load controller_file
    		class_name=controller.capitalize+"Controller"
        ob = Module.const_get(class_name).new(id,@parameter,@session)
        [ob,action]
  	end

end
