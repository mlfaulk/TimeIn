class TeachersController < ApplicationController
	def admin_student_profile()
		id = params[:id]
		@student = Student.find(id)
		@visits = @student.visits
	end

	def post_teacher_login()
		username = params[:username]
		user = Teacher.find_by_username(username)
		if user == nil then
			redirect_to controller:"students", action: "start"
		else
			#check password
			password_attempt = params[:password]
			if password_attempt == user.password then

				#log in returning user
				session[:current_user_id] = user.id
				redirect_to action: "admin_dashboard"
			else
				redirect_to controller:"students", action: "start"
			end
		end


	end

	include ActionView::Helpers::DateHelper
	def admin_dashboard()
		@students = Student.all
		visits = Visit.all
		@updates = Visit.order("created_at").reverse_order.limit(5)


		@num_lastweek = Visit.where(created_at: (1.week.ago)..Time.now).count
		@num_twoweeksago = Visit.where(created_at: (2.week.ago)..(1.week.ago)).count

		@dataarr = Array.new
		@dataarr.push [1, @num_lastweek]
		@dataarr.push [2, @num_twoweeksago]
	end


	def admin_incident_detail()
		id = params[:id]
		@incident = Visit.find(id)
		@student = Student.find(@incident.student_id)

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
		@relateds_student = Visit.where(student_id:@student.id).where.not(id:id).last(3)
		@relateds_incident = Visit.where(reason_num:@incident.reason_num, student_id:@student.id).where.not(id:id).last(3)

	end

end
