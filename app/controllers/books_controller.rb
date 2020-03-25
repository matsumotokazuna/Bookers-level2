class BooksController < ApplicationController
    def create
        book = Book.new(post_book_params)
        book.user_id = current_user.id
        book.save
        redirect_to book_path(book.id)
    end

    def show
        @user = current_user.id
        @book = Book.new
        @post_book = Book.find(params[:id])
    end

    private
    def post_book_params
        params.require(:book).permit(:title, :body)
    end
end