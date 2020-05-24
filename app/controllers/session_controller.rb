class SessionController < ApplicationController

  def index
    @Session = Session.all
  end
end
