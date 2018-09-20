Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'generic#landing'

	get 'users/sign_in', to: 'users#sign_in', as: :user_sign_in

	get 'users/:id/first_edit', to: 'users#first_edit', as: :user_first_edit

	get 'users/:id/profile', to: 'users#profile', as: :user_profile

	resources :users do
  	end

  # Sessions routes to help with login, posting login and logging out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
