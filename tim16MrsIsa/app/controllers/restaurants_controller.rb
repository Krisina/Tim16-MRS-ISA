class RestaurantsController < ApplicationController

	def index
		@restaurant = Restaurant.all
	end
	
	def new
      #Signup Form
      @restaurant = Restaurant.new     
	end
	
  def show
    redirect_to(:controller => 'sessions', :action => 'home')
	flash[:notice] = "Successful"
	flash[:color]= "valid"
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
	
  end
  
  def update
	@restaurant = Restaurant.find(params[:id])
 
	if @restaurant.update(restaurant_params)
	
		url = "http://localhost:3000/restaurants"
		redirect_to url
		flash[:notice] = "Successfully edited."
		flash[:color]= "valid"
	else
		render 'edit'
	end
  end
  
	def create
    	@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			
			redirect_to(:action => 'login')
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
			render "new"
		end	
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :distance, :rating, :friends, :reservation)
	end
end
