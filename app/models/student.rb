class Student < ActiveRecord::Base
	validates :username, presence: true
end
