class TestsController < ApplicationController
  def index
    @users = User.all
    
  end
end
