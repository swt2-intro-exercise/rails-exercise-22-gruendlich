class AuthorsController < ApplicationController
  def new
  end
  def index
  end

  def create
    @article = Author.new_with(author_params)

    @article.save
    redirect_to @article
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
