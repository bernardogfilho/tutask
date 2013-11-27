class CommentsController < ApplicationController
  before_action :set_variables, only: [:show, :edit, :update, :destroy]

  def create
    @comment = @topic.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to project_topic_path(@project, @topic, @comment)
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to project_topic_path(@project, @topic)
    else
      render action: 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to project_topic_path(@project, @topic)
  end

  private

  def set_variables
    @project = Project.find params[:project_id]
    @topic = Topic.find params[:topic_id]
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content) if params[:comment]
  end
end