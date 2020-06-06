class Api::V1::UserController < ApplicationController

  def index
    @user = User.all
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name], password: params[:session][:password])
    if user.present?
       session[:user_id] = user.id
       render "/" , json: user
    else
      #  flash[:notice] = 'ログインできませんでした'
       render json: 'ログインできませんでした'
    end
  end

  def new
    @User = User.create(create_params)
    if @User.save
      session[:user_id] = @User.id
      render "index", json: @User
    else
      render json: @User.errors, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    render json: "success"
  end

  def invest
    if session[:user_id].present?
      render json: 'user true'
    else
      render json: 'user false'
    end
  end

  private
  def create_params
    params.require(:user).permit(:user_name, :password)
  end

end
