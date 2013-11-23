class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @user = current_user
    @topics = current_user.topics
  end
end
