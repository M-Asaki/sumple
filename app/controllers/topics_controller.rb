class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
      if @topic.save
        redirect_to topics_path, notice: "投稿に成功しました"
      else
        flash.now[:alert] = "投稿に失敗しました"
        render :new
      end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
