Rails.application.routes.draw do
	root to: "todo_lists#index"

        resources :accounts, only: [:show, :edit, :update]

	resources :todo_lists do
		resources :todo_items, only: [:new, :update, :show, :edit, :create, :destroy]
	end

	resources :sessions, only: [:new, :create, :destroy]

	 get '/login' => "sessions#new", as: "login"
	 delete '/logout' => "sessions#destroy", as: "logout"
end
