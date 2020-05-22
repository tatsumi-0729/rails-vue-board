class Api::BoardController < ApplicationController

  def index
    @Articles = Article.all
    render json: @Articles
  end

  def show
    @Article = Article.where(id: params[1])
    render "index", json: @Article
  end

end
