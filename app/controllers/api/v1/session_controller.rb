class Api::V1::SessionController < ApplicationController

  def index
    @Session = Session.all
  end

  def create
    session = Session.find_by(user_name: params[:session][:user_name])
    if session&&session.authenticate(params[:session][:password])
       session[:user_id] = session.id
       flash[:notice] = 'ログインが完了しました'
       render board.index
      #  redirect_to roomsAll_path
    else
       flash[:notice] = 'ログインできませんでした'
       render "index" , json: 'ログインできませんでした' 
    end
  end

  def new
    @Session = Session.create(create_params)
    if @Session.save
      render "index", json: @Session
    else
      render json: @Session.errors, status: :unprocessable_entity
    end
  end

  private
  def create_params
    params.require(:session).permit(:user_name, :password)
  end

end
