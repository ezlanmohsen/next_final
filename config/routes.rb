Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'generic#landing'

	get 'users/:id/profile', to: 'users#profile', as: :user_profile

	resources :users do
  end

  resources :projects do
  end

  resources :points do
  end

  resources :assignments do
  end

  # Sessions routes to help with login, posting login and logging out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
