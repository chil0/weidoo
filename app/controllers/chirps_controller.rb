class ChirpsController < ApplicationController
  before_action :set_chirp, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:index, :show, :new,
     :create, :edit, :destroy, :update, :photo]

  # GET /chirps
  # GET /chirps.json
  def index
    # This is the main entrance, after 'log-in'
    #if current_user and current_user.handle_name.blank?
    ##  session[:back_to_home] = true
    ##  redirect_to edit_user_path(current_user.id)
    ##else
    ##  @chirps = Chirp.all
    ##end
    if current_user
      if (current_user.handle_name == nil ||
          current_user.handle_name.length == 0)
          session[:back_to_home] = true
          redirect_to edit_user_path(current_user)
      end
    end
    @follows = Follow.where( user_id: current_user.id )
    @users = @follows.collect { |f| f.to_id }
    @users << current_user.id
    @chirps = Chirp.select{|c| @users.include?( c.user_id )}
    @chirps = @chirps.sort_by{ |c| c[:created_at] }.reverse
  end


  # GET /chirps/1
  # GET /chirps/1.json
  def show
  end

  # GET /chirps/new
  def new
    @chirp = Chirp.new
    @chirp.user_id = current_user.id
  end

  # GET /chirps/1/edit
  def edit
  end

  # POST /chirps
  # POST /chirps.json
  def create
    if params[:chirp][:photo]
      @file = params[:chirp][:photo]
      @chirp = Chirp.new(
        :chirp => params[:chirp][:chirp],
        :photo => @file.read,
        :file_name => @file.original_filename,
        :file_type => @file.content_type,
        :chirped_at => Time.now )
    else
      @chirp = Chirp.new(chirp_params)
    end
    @chirp.user_id = current_user.id

    respond_to do |format|
      if @chirp.save
        format.html { redirect_to @chirp, notice: 'Chirp was successfully created.' }
        format.json { render :show, status: :created, location: @chirp }
      else
        format.html { render :new }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chirps/1
  # PATCH/PUT /chirps/1.json
  def update
    if params[:chirp][:photo]
      @file = params[:chirp][:photo]
      respond_to do |format|
        if @chirp.update(
           :chirp => params[:chirp][:chirp],
           :photo => @file.read,
           :file_name => @file.original_filename,
           :file_type => @file.content_type
         )
          format.html { redirect_to @chirp, notice: 'Chirp was successfully updated.' }
          format.json { render :show, status: :ok, location: @chirp }
        else
          format.html { render :edit }
          format.json { render json: @chirp.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @chirp.update(chirp_params)
          format.html { redirect_to @chirp, notice: 'Chirp was successfully updated.' }
          format.json { render :show, status: :ok, location: @chirp }
        else
          format.html { render :edit }
          format.json { render json: @chirp.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /chirps/1
  # DELETE /chirps/1.json
  def destroy
    @chirp.destroy
    respond_to do |format|
      format.html { redirect_to chirps_url, notice: 'Chirp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def photo
    @chirp = Chirp.find( params[:id] )
    send_data @chirp.photo, :filename => @chirp.file_name,
     :type => @chirp.file_type
  end

  def face
    face = Face.find( params[:id] )
    send_data face.content, :filename => face.name,
      :type=>face.content_type
  end

  def comment
    @chirp = Chirp.find( params[:id] )
    send_data @chirp.comment
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chirp
      @chirp = Chirp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chirp_params
      params.require(:chirp).permit( :user, :user_id, :chirp, :photo, :file_name, :file_type, :chirped_at)
    end
end
