class Teacher < ActiveRecord::Base
	has_and_belongs_to_many		:students
	has_many 					:visits
	has_many 					:notes
end
