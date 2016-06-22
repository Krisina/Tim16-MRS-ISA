class ReservationsController < ApplicationController

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
	@reservation = current_user.reservations.find(params[:id])
  end

  # GET /reservations/new
  def new
    @reservation = current_user.reservations.new
  end

  # GET /reservations/1/edit
  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = current_user.reservations.new(reservation_params)

    if
		@reservation.save
		flash[:notice] = "The reservation has been added."
		flash[:color]= "valid"
		redirect_to current_user
		
    else
      
		flash[:notice] = "Unable to add reservation."
		flash[:color]= "invalid"
		render "new"
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
   # respond_to do |format|
   @reservation = current_user.reservations.find(params[:id])
     if @reservation.update(reservation_params)
	
		redirect_to current_user
		flash[:notice] = "Successfully edited."
		flash[:color]= "valid"
	else
		render 'edit'
	end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy
    flash[:notice] = "The reservation has been removed."
	flash[:color]= "valid"
    redirect_to current_user
  end

  private
	def reservation_params
		params.require(:reservation).permit(:user_id, :reservation_id, :date, :time, :duration, :table, :ResName)
	end
    # Use callbacks to share common setup or constraints between actions.
    #def set_reservation
    #  @reservation = Reservation.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def reservation_params
    #  params.require(:reservation).permit(:user_id, :reservation_id, :date, :time, :duration, :table)
    #end
end
