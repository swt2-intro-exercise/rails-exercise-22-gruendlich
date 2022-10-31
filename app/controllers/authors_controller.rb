class AuthorsController < ApplicationController
  def index
  end
  def show
    @author = Author.find(params[:id])
  end
  def new
  end
  def create
    @article = Author.new(author_params)

    @article.save
    redirect_to @article
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
