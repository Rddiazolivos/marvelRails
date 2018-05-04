Rails.application.routes.draw do
  resources :characters
	root 'home#index'	
  resources :users
  get 'ranking', to:'ranking#index'
  get 'batallas', to: 'battles#batalla'
  get 'battles', to: 'battles#index'
  get 'revivir', to: 'users#revivir'
  get 'historial', to: 'users#historial'
  get 'details', to: 'characters#details'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
	