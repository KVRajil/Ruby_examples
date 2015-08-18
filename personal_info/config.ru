use Rack::Session::Cookie , :secret => 'change_me'
use Rack::CommonLogger
use Rack::ShowExceptions
use Rack::Lint
use Rack::MethodOverride
use Rack::Static,
  :urls => ["/media/images", "/media/js", "/media/css"],
  :root => "public"
  require_relative 'router'
class Dispatcher

  def self.call(env)
		new(env).response
	end
  def initialize(env)
		@request=Rack::Request.new(env)
	end

  def response
    @path= @request.path_info
    @req_method=@request.request_method
    @parameters=@request.params
    @obj = Router.call(@path,@req_method,@parameters)
    @resp=Rack::Response.new
    @resp.write @obj
    @resp.finish
  end

end

run Dispatcher
