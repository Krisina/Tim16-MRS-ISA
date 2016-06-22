class RestaurantsController < ApplicationController

	def index
		@restaurant = Restaurant.all
	end
	
	def new
      #Signup Form
      @restaurant = Restaurant.new     
	end
	
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
	
  end
  
  def update
	@restaurant = Restaurant.find(params[:id])
 
	if @restaurant.update(restaurant_params)
	
		redirect_to restaurant_path
		flash[:notice] = "Successfully edited."
		flash[:color]= "valid"
	else
		render 'edit'
	end
  end
  
	def create
    	@restaurant = Restaurant.new(restaurant_params)
		if 
			@restaurant.save
			flash[:notice] = "The restaurant has been added."
			flash[:color]= "valid"
			url = "http://localhost:3000/restaurants"
			redirect_to url
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
			render "new"
		end	
	end

  #def destroy
   # @restaurant = Restaurant.find(params[:id])
   # @restaurant.destroy
   # flash[:notice] = "The restaurant has been removed."
   # flash[:color]= "valid"
   # redirect_to restaurant_path
  # end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :distance, :rating, :friends, :reservation)
	end
end
