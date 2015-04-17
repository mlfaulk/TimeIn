class TeachersController < ApplicationController
	def admin_student_profile()
		id = params[:id]
		@student = Student.find(id)
		@visits = @student.visits

	end

	def admin_dashboard()
		@students = Student.all
		
	end

	def admin_incident_detail()
		id = params[:id]
		@incident = Visit.find(id)
		@student = Student.find(@incident.student_id)

		reason_num = @incident.reason_num
		if (reason_num == "1") then
			@reason = "Spoke when he/she was supposed to be quiet."
		end
		if (reason_num == "2") then 
			@reason = "Used inappropriate language."
		end
		if (reason_num == "3") then
			@reason = "Was mean to a classmate."
		end
		if (reason_num == "4") then
			@reason = "Was disruptive to the class."
		end

		task = @incident.task_choice
		if (task == "promise") then
			@action = "Made a promise"
		end
		if (task == "teacher") then 
			@action = "Wrote a note to teacher"
		end
		if (task == "freewrite") then
			@action = "Completed a freewrite"
		end

		date_time = @incident.date_time
		@time = date_time.strftime("%A, %b %d, %H:%M")



		@response = @incident.task_text
	end

end
