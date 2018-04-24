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

  def index
    @topics = Topic.all.includes(:favorite_users)
    @comment = Comment.new
  end

  def comments
    def create
      @comment = Comment.new(:comment_params)
      @comment.body = comment.body(:comment_params)
      if @comment.save
        redirect_to topics_path, notice: 'コメント登録しました'
      else
        redirect_to topics_path, notice: 'コメント登録に失敗しました'
      end
    end

    def index
      @comment = Comment.all.includes(:topic_id)
      @topics = Topic.all.includes(:favorite_users)
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end

  def comment_params
    params.require(:comment).permit(
      :body
    )
  end
end
