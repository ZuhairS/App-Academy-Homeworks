class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    Book.create!(book_params)
    redirect_to books_url
    # if new_book.save
    # else
    #   flash.now[:errors] = new_book.errors.full_messages
    #   render :new
    # end
  end

  def destroy
    deleted_book = Book.find(params[:id])
    deleted_book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
