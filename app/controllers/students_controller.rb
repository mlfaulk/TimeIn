class StudentsController < ApplicationController
	def start()
	end

	def login()

	end

	def post_login()
		username = params[:username]

		#if (username == "") then
			#@invalid_username = true
			#return to login page
			#render action: "login"
		#end

		student = Student.find_by_username(username)
		if student == nil then
			#create new student
			new_student = Student.new
			new_student.username = username
			new_student.visit_count = 1
			new_student.current_reason_num = params[:reason_num]
			if new_student.save then
				session[:current_user_id] = new_student.id
				#create new visit
				new_visit = Visit.new
				new_visit.student_id = new_student.id
				new_visit.date_time = DateTime.now
				new_visit.reason_num = params[:reason_num]
				new_visit.save
				new_student.current_visit_id = new_visit.id
				new_student.save
				redirect_to action: "character", id: new_student.id
			else
				#return to login page
				render action: "login"
			end
		else
			#log in returning student
			session[:current_user_id] = student.id
			#create new visit
			new_visit = Visit.new
			new_visit.student_id = student.id
			new_visit.date_time = DateTime.now
			new_visit.reason_num = params[:reason_num]
			new_visit.save
			#new_visit.reason = 
			#update visit count
			visits = student.visit_count
			student.visit_count = visits + 1
			student.current_reason_num = params[:reason_num]
			student.current_visit_id = new_visit.id
			student.save
			redirect_to action: "character", id: student.id
		end
	end

	def chill() 
	end

	def character()
		student_id = params[:id]
		student = Student.find(student_id)
		@name = student.username
	end

	def learn()
	end

	def post_task()
		student_id = session[:current_user_id]
		student = Student.find(student_id)
		visit_id = student.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_text = params[:text]
		visit.save
		redirect_to action: "finish"
	end

	def teacher()
		#update task choice
		student_id = session[:current_user_id]
		student = Student.find(student_id)
		visit_id = student.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_choice = "teacher"
		visit.save
	end

	def freewrite()
		#update task choice
		student_id = session[:current_user_id]
		student = Student.find(student_id)
		visit_id = student.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_choice = "freewrite"
		visit.save
	end

	def promise()
		#update task choice
		student_id = session[:current_user_id]
		student = Student.find(student_id)
		visit_id = student.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_choice = "promise"
		visit.save
	end

	def finish() 
		student_id = session[:current_user_id]
		student = Student.find(student_id)
		@name = student.username
		reason_num = student.current_reason_num
		if (reason_num == 1) then
			@reason = "spoke when he/she was supposed to be quiet."
		end
		if (reason_num == 2) then 
			@reason = "used inappropriate language."
		end
		if (reason_num == 3) then
			@reason = "was mean to a classmate."
		end
		if (reason_num == 4) then
			@reason = "was disruptive to the class."
		end

		visit_id = student.current_visit_id
		visit = Visit.find(visit_id)
		@text = visit.task_text


	end

	def end()
		reset_session
		redirect_to action: "start"
	end


	




end