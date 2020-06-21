class CommentController < ApplicationController

  def index
    @comment = Comment.all
  end

  
end
