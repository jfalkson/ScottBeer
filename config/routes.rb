Scottwebsite::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    root 'beers#index'
	resources :beers
	resources :comments
	resources :votes
	get '/contact', to: 'static#contact'
	get '/about', to: 'static#about'
	get '/donate', to: 'static#donate'
	
end
