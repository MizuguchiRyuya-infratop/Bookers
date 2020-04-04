class BooksController < ApplicationController
	def tops
	end

	def index
		@books = Book.all
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
	end
end