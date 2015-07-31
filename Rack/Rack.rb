require 'rack'
require 'rack/server'

class HelloWorldApp
  def self.call(env)
    [200, {}, ["Hello World. You said: #{env['QUERY_STRING']}"]]
  end
end

Rack::Server.start :app => HelloWorldApp
