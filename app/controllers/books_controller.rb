class BooksController < ApplicationController
    before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]
    
    def new
        @book = Book.new
        @books = Book.all
    end

    def index
        @books = Book.all
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "You have creatad book successfully."
            redirect_to @book
        else
            @books = Book.all
            render 'index'
        end
    end

    def show
        @book = Book.find(params[:id])
        @books = Book.new
    end

    def edit
        @book = Book.find(params[:id])

    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
          redirect_to @book
        else
          render 'edit'
        end
    end

    private
    def book_params
        params.require(:book).permit(:title, :opinion)
    end
end
