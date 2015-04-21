class Student < ActiveRecord::Base
	validates :username, presence: true
	has_and_belongs_to_many		:teachers
	has_many  					:visits

	def gender_pronoun()
		gender_num = self.gender
		if (gender_num == 1) then
			return "she"
		else
			return "he"
		end
	end
     
end
