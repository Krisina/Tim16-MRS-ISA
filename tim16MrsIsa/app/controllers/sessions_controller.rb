class SessionsController < ApplicationController
 
	before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
	before_filter :save_login_state, :only => [:index, :login, :login_attempt]

	def home
		#Home Page
	end

	def profile
		#Profile Page
	end

	def setting
		#Setting Page
		redirect_to(:controller => 'restaurants', :action => 'new')
	end

	def login
		#Login Form
	end

	def login_attempt
		authorized_user = User.authenticate(params[:email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Welcome again, #{authorized_user.ime} #{authorized_user.prezime}!"
			redirect_to(:action => 'home')


		else
			flash[:notice] = "Invalid Username or Password"
        	flash[:color]= "invalid"
			render "login"	
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end

end
