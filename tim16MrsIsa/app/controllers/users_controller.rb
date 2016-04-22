class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]

  def index
    #@user = User.all
	
	#@user = @user.search(params[:search])
	
	#FOR SEARCHES
	if params[:search]
		@user = User.search_by_name(params[:search])
	else
		@user = User.all
	end

  end
  
  def new
      #Signup Form
      @user = User.new     
  end
  
  def show
	@user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
	@user = User.find(params[:id])
 
	if @user.update(user_params)
		redirect_to(:controller => 'sessions', :action => 'login')
	else
		render 'edit'
	end
  end

   def create
    	@user = User.new(user_params)
    	if @user.save

			    redirect_to(:controller => 'sessions', :action => 'login')
				flash[:notice] = "Successful!"
				flash[:color]= "valid"
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
			render "new"
		end	
		
    end
	
	#def destroy
    #	@user = User.find(params[:id])
	#	@friendship.destroy
	#	flash[:notice] = "The user has been removed."
	#	redirect_to @user
    #end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :ime, :prezime, :adresa)
  end
end
