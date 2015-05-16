class StudentsController < ApplicationController
	def start()
	end


	def login()
		students = Student.all 
        @namesArray = [] 
        count = 0 
        for student in students do 
          	@namesArray[count] = [student.firstname + " " + student.lastname, student.firstname]
            count = count + 1
        end
	end



	include ActionView::Helpers::DateHelper
	def post_login()
		firstname = params[:student_name]

		student = Student.find_by_firstname(firstname)
		if student == nil then
			#create new student
			new_student = Student.new
			new_student.username = username
			new_student.visit_count = 1
			#JULIA'S EDITS: default image for anyone not in the system
			new_student.image_file_name = 'face.png'
			new_student.current_reason_num = params[:reason_num]

			if new_student.save then
				session[:current_user_id] = new_student.id
				#create new visit
				new_visit = Visit.new
				new_visit.student_id = new_student.id
				new_visit.date_time = Time.now
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
			new_visit.date_time = Time.now
			new_visit.end_time=-1
			new_visit.reason_num = params[:reason_num]
			new_visit.save
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

	def strength()
		@student_id = params[:id]
		student = Student.find(@student_id)
		@name = student.firstname
	end


	def character()
		@student_id = params[:id]
		student = Student.find(@student_id)
		@name = student.firstname
	end

	def learn()
		@student_id = params[:id]
		student = Student.find(@student_id)
		@name = student.firstname
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
		@student_id = params[:id]
		student = Student.find(@student_id)
		@name = student.firstname

		#update task choice
		student_id = session[:current_user_id]
		student = Student.find(student_id)
		visit_id = student.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_choice = "teacher"
		visit.save
	end

	def freewrite()
		@student_id = params[:id]
		student = Student.find(@student_id)
		@name = student.firstname

		#update task choice
		student_id = session[:current_user_id]
		student = Student.find(student_id)
		visit_id = student.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_choice = "freewrite"
		visit.save
	end

	def promise()
		@student_id = params[:id]
		student = Student.find(@student_id)
		@name = student.firstname
		
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
		@student = Student.find(student_id)
		@name = @student.firstname
		visit_id = @student.current_visit_id
		@visit = Visit.find(visit_id)
		@visit.end_time = Time.now
		@visit.save

		@text = @visit.task_text

		reason_num = @student.current_reason_num

		num_today = Visit.where(student_id:student_id).where(created_at: (Date.today)..(Date.today+1)).count


		account_sid = 'ACeeff1afe4b8a88ddbba302313d60dc73' 
		auth_token = 'f9af84b19b5aa007e4ed6b11abc943a5' 
		message = "#{@student.firstname} just completed a TimeIn. She wrote '#{@text}' for her task response."
		if num_today > 1 
			message+=" NOTICE: #{@student.firstname} has had 2+ TimeIns today"
		end

		begin
		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
			:from => '+14694163921', 
			:to => '2146423603', 
			:body => message
		})
		rescue Twilio::REST::RequestError => e
		    puts e.message
		end
	end

	def end()
		reset_session
		redirect_to action: "start"
	end

end
