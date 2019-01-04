# -*- coding: utf-8 -*-
class FindFriendsController < ApplicationController
  def index
    @user = User.new
  end

  def search
  end

  def search
     email  = params[:user][:email]
     handle = params[:user][:handle_name]
     if email.present?
       @users  = User.where( "email like '%"+email +"%'" )
       @message = "#{email} in email"
     else
       @users = []
       @message = ""
     end
     if handle.present?
       # Note we are operating |(or) to array instance.
       @users |= User.where("handle_name like '%" + handle + "%'" )
       if @message.present?
         @message += ", or "
       end
       @message += "#{handle} in handle"
     end
     if @message.present?
       @message += "List of users"
     else
       @message = "No search Condition is given."
     end
     @users -= [current_user]  # Exclude self
     @follows = Follow.where(user_id: current_user.id)

     respond_to do |format|
       format.html {render :template => "follows/list"}
       format.json {render json: @users}
     end
   end
end
