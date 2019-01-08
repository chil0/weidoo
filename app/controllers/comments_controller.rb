# -*- coding: utf-8 -*-
class CommentsController < ApplicationController
  before_action :set_chirp, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:index, :show, :new,
     :create, :edit, :destroy, :update, :photo]

   def create
      @chirp = Chirp.find(params[:chirp_id])
      @comment = @chirp.comments.create(comment_params)
      redirect_to article_path(@chirp)
    end

    private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
