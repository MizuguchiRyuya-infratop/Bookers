class BooksController < ApplicationController
	def tops
	end

	def index
		@books = Book.all.order('created_at DESC')
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			flash[:success] = 'successfully'
			redirect_to book_path(@book.id)
		else
			@books = Book.all.order('created_at DESC')
			render 'index'
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end