class Student < ActiveRecord::Base
	validates :username, presence: true
	has_and_belongs_to_many		:students
	has_many  					:visits
end
