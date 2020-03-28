class BooksController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @book = Book.new(post_book_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to book_path(@book.id)
    end

    def show
        @user = current_user
        @book = Book.new
        @post_book = Book.find(params[:id])
    end

    def index
        @books = Book.all
        @user = current_user
        @book = Book.new
    end

    def edit
        @book =  Book.find(params[:id])
    end

    def update
        @book =  Book.find(params[:id])
        @book.update(post_book_params)
        redirect_to book_path(@book.id)
    end

    def destroy
        @post_book =  Book.find(params[:id])
        @post_book.destroy
        redirect_to books_path
    end

    private
    def post_book_params
        params.require(:book).permit(:title, :body)
    end
end