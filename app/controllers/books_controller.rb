class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
    else
    @books = Book.all
    @user = current_user
    render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    unless  @user == current_user
    redirect_to books_path
    end
    flash[:notice] = "You have updated book successfully."
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book)
  else
    render :edit
  end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
