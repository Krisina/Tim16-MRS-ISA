class FriendshipsController < ApplicationController
  #before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  #def index
  #  @friendships = Friendship.all
  #end

  # GET /friendships/1
  # GET /friendships/1.json
  #def show
  #end

  # GET /friendships/new
  #def new
  #  @friendship = Friendship.new
  #	redirect_to "http://localhost:3000/users"
  #end

  # GET /friendships/1/edit
  #def edit
  #end

  # POST /friendships
  # POST /friendships.json
  def create
	#check_friend = Friendship.check(params[:email])
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
     if# check_friend
		@friendship.save
		flash[:notice] = "The friend has been added."
		redirect_to current_user
		
    else
      
		flash[:error] = "Unable to add friend."
		redirect_to root_url
    end
  end

 #def update
 #   if @friendship.update(:friend_id => params[:friend_id])
 #     flash[:notice] = "Updated friend."
 #     redirect_to root_url
 #   else
 #     flash[:error] = "Unable to update friend."
 #     redirect_to root_url
 #   end
 # end


  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "The friend has been removed."
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  #  def set_friendship
  #    @friendship = Friendship.find(params[:id])
  #  end

    # Never trust parameters from the scary internet, only allow the white list through.
  #  def friendship_params
  #    params.require(:friendship).permit(:user_id, :friend_id)
  #  end
end
