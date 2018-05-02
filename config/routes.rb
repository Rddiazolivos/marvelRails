Rails.application.routes.draw do
  resources :characters
	root 'home#index'	
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
	