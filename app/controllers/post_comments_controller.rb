class PostCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comments_params)
    comment.book_id = book.id
    if comment.save
      redirect_to book_path(book)
    else
      redirect_to book_path(book)
    end
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def post_comments_params
    params.require(:post_comment).permit(:comment)
  end

end
