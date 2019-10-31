class CommentsController < ApplicationController
  def create

  end

  def new
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
