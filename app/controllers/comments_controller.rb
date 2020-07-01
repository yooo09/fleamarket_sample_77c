class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to item_path(params[:item_id])}
      end
    else
      flash[:notice] = "失敗しました"
    end
  end

  def destroy
    @comment = Comment.find(params[:item_id])
    if @comment.destroy
      redirect_to item_path
    else
      flash[:notice] = "削除に失敗しました"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
