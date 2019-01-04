class FacesController < ApplicationController
  before_action :authenticate_user!
def register
  @face = Face.new
  @user = User.find(current_user.id)
end

# PUT /faces/update
# PUT /faces/update.json
def update
  @face = Face.find_by_user_id( current_user.id )
  @face.destroy if @face
  @user = User.find( current_user.id )
  if params[:file]
    @file = params[:file][:upload]
    if @file && @file.respond_to?(:original_filename)
      face_params = {
        :user_id => @user.id,
        :name => @file.original_filename,
        :content_type => @file.content_type,
        :content => @file.read
      }
      @face = Face.new( face_params )
    end
  end
  if @face.save
    respond_to do |format|
      format.html { redirect_to  edit_user_path( :id => current_user.id ),
        :notice => 'Face photo was successfully uploaded.' }
      format.json { render @user, status: :created, location: @user }
    end
  else
    respond_to do |format|
      format.html { render action: "register", :alert => 'Failed to register face photo.' }
      format.json { render json: @faces.errors, status: :unprocessable_entity }
    end
  end
end
end
