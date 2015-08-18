require 'rubygems'
require 'active_record'
require 'mysql'

ActiveRecord::Base.establish_connection(
    :adapter => "mysql",
    :host => "localhost",
    :database => "students" ,
    :username => "root" ,
    :password=> "" )

class PersonInfo < ActiveRecord::Base


end
