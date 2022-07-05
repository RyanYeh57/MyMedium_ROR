class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_story, only: [:create]

  def create
    @comment = @story.comments.new(comment_params)
    @comment.user = current_user

    unless @comment.save
      render js: "alert('error')"
    end
  end

  def show
    @comment = @story.comments.new # 因為有 has_many 才可以使用
    @comments = @story.comments.order(id: :desc)
  end

  private
  def find_story
    @story = Story.friendly.find(params[:story_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end


