Rails.application.routes.draw do
  resources :battles
  resources :characters
	root 'home#index'	
  resources :users
  get 'ranking', to:'ranking#index'
  get 'batallas', to: 'battle#batalla'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
	