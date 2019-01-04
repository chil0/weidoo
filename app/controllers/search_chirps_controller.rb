# -*- coding: utf-8 -*-
class SearchChirpsController < ApplicationController
  before_action :authenticate_user!
  # GET /search_chirps/index
  # GET /search_chirps/index.json
  def index
    @chirp = Chirp.new
  end

  def search
    chirp  = params[:chirp][:chirp]
    if chirp.length>0
      @chirps  = Chirp.where( "chirp like '%" +chirp +"%'" )
      @message = "List of chirps including '#{chirp}'"
    else
      @chirps= []
      @message = "No search condition is given."
    end

    respond_to do |format|
      format.html { render :template => "chirps/index" }
      format.json { render json: @chirps }
    end
  end
end
