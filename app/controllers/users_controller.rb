class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @topics = current_user.topics
  end
end
