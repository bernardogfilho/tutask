class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @project = Project.find params[:project_id]
    @topic = Topic.find params[:topic_id]
    @comment = @topic.comments.build(comment_params)

    if @comment.save
      redirect_to project_topic_path(@project, @topic, @comment)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content) if params[:comment]
  end
end