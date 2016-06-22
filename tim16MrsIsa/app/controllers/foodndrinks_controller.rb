class FoodndrinksController < ApplicationController

  # GET /foodndrinks
  # GET /foodndrinks.json
  def index
    @foodndrinks = Foodndrink.all
  end

  # GET /foodndrinks/1
  # GET /foodndrinks/1.json
  def show
    @foodndrink = current_user.foodndrinks.find(params[:id])
  end

  # GET /foodndrinks/new
  def new
    @foodndrink = current_user.foodndrinks.new
  end

  # GET /foodndrinks/1/edit
  def edit
    @foodndrink = current_user.foodndrinks.find(params[:id])
  end

  # POST /foodndrinks
  # POST /foodndrinks.json
  def create
    @foodndrink = current_user.foodndrinks.new(foodndrink_params)

    if
		@foodndrink.save
		flash[:notice] = "The food or drink has been added."
		flash[:color]= "valid"
		redirect_to current_user
		
    else
      
		flash[:notice] = "Unable to add food or drink."
		flash[:color]= "invalid"
		render "new"
    end
  end

  # PATCH/PUT /foodndrinks/1
  # PATCH/PUT /foodndrinks/1.json
  def update
    @foodndrink = current_user.foodndrinks.find(params[:id])
     if @foodndrink.update(foodndrink_params)
	
		redirect_to current_user
		flash[:notice] = "Successfully edited."
		flash[:color]= "valid"
	else
		render 'edit'
	end
  end

  # DELETE /foodndrinks/1
  # DELETE /foodndrinks/1.json
  def destroy
    @foodndrink = current_user.foodndrinks.find(params[:id])
    @foodndrink.destroy
    flash[:notice] = "The food or drink has been removed."
	flash[:color]= "valid"
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_foodndrink
    #  @foodndrink = Foodndrink.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foodndrink_params
      params.require(:foodndrink).permit(:user_id, :foodndrink_id, :food, :drink, :ResName)
    end
end
