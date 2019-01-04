class FollowsController < ApplicationController
before_action :authenticate_user!

  def list
    @users = User.all
    @users -= [current_user]

    @follows = Follow.where( user_id: current_user.id )
  end
  # put /follows/follow
  # put /follows/follow.json
  def follow
    follow_params = {
      :to_id => params[:id],
      :user_id => current_user.id
    }
    @follow = Follow.new( follow_params )

    respond_to do |format|
      if @follow.save
        format.html { redirect_to follows_list_path }
        format.json { render :json => @follow  }
      else
        format.html { render action: "list", :alert => 'Failed to follow.' }
        format.json { render json: @follow.errors }
      end
    end
  end
  # put /follows/cancel
  # put /follows/cancel.json
  def cancel
    @follow = Follow.find_by_id( params[:id] )
    @follow.destroy
    redirect_to follows_list_path
  end

end
