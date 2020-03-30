class BooksController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @book = Book.new(post_book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "You have creatad book successfully."
            redirect_to book_path(@book.id)
        else
            render action: :show
        end
    end

    def show
        @user = current_user
        @book = Book.new
        @post_book = Book.includes(:user).find(params[:id])
    end

    def index
        @books = Book.all.includes(:user)
        @user = current_user
        @book = Book.new
    end

    def edit
        @book =  Book.find(params[:id])
        if @book.user_id == current_user.id
        else
        redirect_to books_path
        end
    end

    def update
        @book =  Book.find(params[:id])
        if @book.update(post_book_params)
            flash[:notice] = "You have updated book successfully." 
            redirect_to book_path(@book.id)
        else
            render action: :edit
        end
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