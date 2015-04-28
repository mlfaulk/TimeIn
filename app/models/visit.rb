class Visit < ActiveRecord::Base
	has_many 		:notes 

	def get_reason()
		reason_num = self.reason_num.to_i
		if (reason_num == 1) then
			return "spoke when " + get_student().gender_pronoun() + " was supposed to be quiet"
		elsif (reason_num == 2) then 
			return "used inappropriate language"
		elsif (reason_num == 3) then
			return "was mean to a classmate"
		elsif (reason_num == 4) then
			return "was disruptive to the class"
		elsif (reason_num == 5) then
			return "was disrespectful"
		elsif (reason_num == 6) then
			return "was agressive or violent in class"
		end

	end

	def get_student()
		return Student.find(self.student_id)
	end

	def get_action()
		task = self.task_choice
		if (task == "promise") then
			return "Made a promise"
		elsif (task == "teacher") then 
			return "Wrote a note to teacher"
		elsif (task == "freewrite") then
			return "Completed a freewrite"
		end
		return nil
	end
	
end
