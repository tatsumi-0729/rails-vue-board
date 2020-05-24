class BoardController < ApplicationController

  def index
    @Articles = Article.all
  end

end
