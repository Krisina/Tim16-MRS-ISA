class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]

  def index
    @user = User.all
  end
  
  def new
      #Signup Form
      @user = User.new     
  end
  
  def show
    redirect_to(:controller => 'sessions', :action => 'login')
	flash[:notice] = "You Signed up successfully"
	flash[:color]= "valid"
  end
  
  def edit
    @user = User.find(params[:id])
	
  end
  
  def update
	@user = User.find(params[:id])
 
	if @user.update(user_params)
		redirect_to @user
	else
		render 'edit'
	end
  end

   def create
    	@user = User.new(user_params)
    	if @user.save

			redirect_to(:action => 'login')
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
			render "new"
		end	
		
    end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
