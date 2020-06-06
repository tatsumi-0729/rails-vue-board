class UserController < ApplicationController

  def index
    @User = User.all
  end
end
