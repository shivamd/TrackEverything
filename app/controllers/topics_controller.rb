class TopicsController < ApplicationController
  before_filter :authenticate_user!

  def new 
    @topic = Topic.new
    @question = @topic.questions.build
  end

  def create
    @topic = Topic.new(topic_params)
    unless @topic.save 
      flash.now[:error] = "Unable to create topic"
      render :new
    else
      UsersTopic.create(topic_id: @topic.id, user_id: current_user.id)
      redirect_to topic_path(@topic), notice: "Successfully created a topic"
    end
  end

  def show
    @topic = Topic.includes(:questions).find(params[:id])
  end

  private 

  def topic_params
    params.require(:topic).permit(:frequency,:time, :name, questions_attributes: [:content, :_destroy])
  end
end
