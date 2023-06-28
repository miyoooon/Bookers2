class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to

  end

  def edit
  end

  def show
  end

  private
  def book_params
  params.require(:book).permit(:title,:body)
  end

end
