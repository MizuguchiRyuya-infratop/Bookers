Rails.application.routes.draw do
	root 'books#top'
	resources :books
end
