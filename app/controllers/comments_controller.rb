class CommentsController < ApplicationControlle
  before_action :authenticate_user!# 使用者需登入(devise的方法)
  before_action :find_story, only: [:create]

  def create
    @comment = @story.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      render js: "alert('save')"
    else
      render js: "alert('error')"
    end
  end


  private

  def find_story
    @story = Story.friendly.find(params[:story_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
