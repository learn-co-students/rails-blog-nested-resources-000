class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: params[:post_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { redirect_to @post }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end

end
