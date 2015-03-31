class UsersController < ApplicationController
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

		user = User.find_by_username(username)
		if user == nil then
			#create new user
			new_user = User.new
			new_user.username = username
			new_user.visit_count = 1
			new_user.current_reason_num = params[:reason_num]
			if new_user.save then
				session[:current_user_id] = new_user.id
				#create new visit
				new_visit = Visit.new
				new_visit.user_id = new_user.id
				new_visit.date_time = DateTime.now
				new_visit.reason_num = params[:reason_num]
				new_visit.save
				new_user.current_visit_id = new_visit.id
				new_user.save
				redirect_to action: "character", id: new_user.id
			else
				#return to login page
				render action: "login"
			end
		else
			#log in returning user
			session[:current_user_id] = user.id
			#create new visit
			new_visit = Visit.new
			new_visit.user_id = user.id
			new_visit.date_time = DateTime.now
			new_visit.reason_num = params[:reason_num]
			new_visit.save
			#new_visit.reason = 
			#update visit count
			visits = user.visit_count
			user.visit_count = visits + 1
			user.current_reason_num = params[:reason_num]
			user.current_visit_id = new_visit.id
			user.save
			redirect_to action: "character", id: user.id
		end
	end

	def chill() 
	end

	def character()
		user_id = params[:id]
		user = User.find(user_id)
		@name = user.username
	end

	def learn()
	end

	def post_task()
		user_id = session[:current_user_id]
		user = User.find(user_id)
		visit_id = user.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_text = params[:text]
		visit.save
		redirect_to action: "finish"
	end

	def teacher()
		#update task choice
		user_id = session[:current_user_id]
		user = User.find(user_id)
		visit_id = user.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_choice = "teacher"
		visit.save
	end

	def freewrite()
		#update task choice
		user_id = session[:current_user_id]
		user = User.find(user_id)
		visit_id = user.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_choice = "freewrite"
		visit.save
	end

	def promise()
		#update task choice
		user_id = session[:current_user_id]
		user = User.find(user_id)
		visit_id = user.current_visit_id
		visit = Visit.find(visit_id)
		visit.task_choice = "promise"
		visit.save
	end

	def finish() 
		user_id = session[:current_user_id]
		user = User.find(user_id)
		@name = user.username
		reason_num = user.current_reason_num
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

		visit_id = user.current_visit_id
		visit = Visit.find(visit_id)
		@text = visit.task_text


	end

	def end()
		reset_session
		redirect_to action: "start"
	end


	




end
