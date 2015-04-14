class Student < ActiveRecord::Base
	validates :username, presence: true
	has_and_belongs_to_many		:teachers
	has_many  					:visits
end
