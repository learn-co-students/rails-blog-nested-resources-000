class CommentsController < ApplicationController

  def create
    binding.pry
    @comment = Comment.new(comment_params)
  end



  private

    def post_params
      params.require(:comment).permit(:content)
    end

end
