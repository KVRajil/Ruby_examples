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

  validate :username_format
    def username_format
       has_one_letter = username =~ /[a-zA-Z]/
       all_valid_characters = username =~ /^[a-zA-Z0-9\s]+$/
       errors.add(:username, "must have at least one letter and contain only letters, digits, or whitespace") unless (has_one_letter and all_valid_characters)
     end
      validates_uniqueness_of :mailid, :case_sensitive => false
      validates_format_of :mailid,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
      validates_presence_of :age
      validates :age, numericality: true, allow_blank: true
      validates_presence_of :sex
      validates_presence_of :password

end
