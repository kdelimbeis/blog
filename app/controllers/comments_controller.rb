class CommentsController < ApplicationController
  def index
    @comments = Article.find(params[:article_id]).comments
  end

  def show
    article = Article.find(params[:article_id])
    @comment = article.comments.find(params[:id])
  end

  def create
   @article = Article.find(params[:article_id])
   @comment = @article.comments.build(comment_params)
   @comment.user = current_user
   @comment.save
   redirect_to article_path(@article)
  end

 def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

 private
   def comment_params
     params.require(:comment).permit(:commenter, :body, :article_id)
   end
end
