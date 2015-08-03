require 'rubygems'
require 'active_record'
require 'mysql'

ActiveRecord::Base.establish_connection(
    :adapter => "mysql",
    :host => "localhost",
    :database => "students" ,
    :username => "root" ,
    :password=> "" )

class Detail < ActiveRecord::Base
     attr_accessor :info
     def info
       [:name, :age, :mailid, :hobbies]
     end
     validate :username_format
    def username_format
       has_one_letter = name =~ /[a-zA-Z]/
       all_valid_characters = name =~ /^[a-zA-Z0-9\s]+$/
       errors.add(:name, "must have at least one letter and contain only letters, digits, or whitespace") unless (has_one_letter and all_valid_characters)
     end
      validates_uniqueness_of :mailid, :case_sensitive => false
      validates_format_of :mailid,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
      validates_presence_of :age
      validates :age, numericality: true, allow_blank: true
end
