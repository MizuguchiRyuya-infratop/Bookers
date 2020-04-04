class BooksController < ApplicationController
	def tops
	end

	def index
		@books = Book.all
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

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:success] = 'successfully'
			redirect_to book_path(@book.id)
		else
			@books = Book.all.order('created_at DESC')
			render 'edit'
		end
	end

	def destroy
		book = Book.find(params[:id])
		if book.destroy
			flash[:success] = '削除しました'
			redirect_to books_path
		else
			flash[:danger] = '削除できませんでした'
			redirect_to books_path
		end
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end