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

  def edit
    @project = Project.find params[:project_id]
    @topic = Topic.find params[:topic_id]
  end

  def update
    @project = Project.find params[:project_id]
    @topic = Topic.find params[:topic_id]
    if @comment.update(comment_params)
      redirect_to project_topic_path(@project, @topic)
    else
      render action: 'edit'
    end
  end

  def destroy
    @project = Project.find params[:project_id]
    @topic = Topic.find params[:topic_id]
    @comment.destroy
    redirect_to project_topic_path(@project, @topic)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content) if params[:comment]
  end
end