class Api::BoardController < ApplicationController

  def index
    @Articles = Article.all
    render json: @Articles
  end

end
