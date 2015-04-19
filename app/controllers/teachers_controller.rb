class TeachersController < ApplicationController
	def admin_student_profile()
		id = params[:id]
		@student = Student.find(id)
		@visits = @student.visits

	end
	include ActionView::Helpers::DateHelper
	def admin_dashboard()
		@students = Student.all
		visits = Visit.all
		@updates = Visit.order("created_at").reverse_order.limit(5)

		@num_lastweek = Visit.where(created_at: (1.week.ago)..Time.now).count
		@num_twoweeksago = Visit.where(created_at: (2.week.ago)..(1.week.ago)).count


		
	end


	def admin_incident_detail()
		id = params[:id]
		@incident = Visit.find(id)
		@student = Student.find(@incident.student_id)

		reason_num = @incident.reason_num

		task = @incident.task_choice
		if (task == "promise") then
			@action = "Made a promise"
		elsif (task == "teacher") then 
			@action = "Wrote a note to teacher"
		elsif (task == "freewrite") then
			@action = "Completed a freewrite"
		end

		@reason = "[No Description]"
		if (reason_num == "1") then
			@reason = "Spoke when he/she was supposed to be quiet."
		elsif (reason_num == "2") then 
			@reason = "Used inappropriate language."
		elsif (reason_num == "3") then
			@reason = "Was mean to a classmate."
		elsif (reason_num == "4") then
			@reason = "Was disruptive to the class."
		end

		date_time = @incident.date_time
		@time = date_time.strftime("%A, %b %d, %H:%M")
		diff = (@incident.end_time - date_time)

		##seconds = (@incident.end_time.seconds-date_time.seconds)
		##mins = (@incident.end_time.min-date_time.seconds)

		@duration = distance_of_time_in_words(date_time, @incident.end_time, include_seconds: true)

		##if (seconds<0) then
		##	seconds = seconds + 60
		##end 

		@response = @incident.task_text
		@relateds_student = Visit.where(student_id:@student.id).last(3)
		@relateds_incident = Visit.where(reason_num:@incident.reason_num, student_id:@student.id)


	end

end
