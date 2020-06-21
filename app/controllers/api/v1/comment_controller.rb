class Api::V1::CommentController < ApplicationController

  def create
    if session[:user_id] == nil
      render json: 'user false'
      return
    end

    comment = Comment.create(create_params)
    comment.user_id = session[:user_id]
    if comment.save
      render json: comment
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def show
    @comments = Comment.where(room_id: params[:id])
    if @comments.present?
      render json: @comments
    else
      render json: "コメントがありません。"
    end
  end

  private
  def create_params
    params.require(:comment).permit(:content,:room_id)
  end

end
