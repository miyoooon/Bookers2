class BooksController < ApplicationController
  def new
     @book = Book.new
  end

  def index
    @books = Book.all
    @user2 = User.find(current_user.id)
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:success] = "You have created book successfully."
       redirect_to book_path(@book.id)
    else
       @books = Book.all
       @user2 = User.find(current_user.id)
       render :index
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
      render :edit
    end

  end

  def show
    @user2 = current_user
    @book = Book.new
    @books = Book.all
    @booker = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path

  end

  private
  def book_params
  params.require(:book).permit(:title,:body)
  end

end
