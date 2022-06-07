Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    member do
      get :profile
      patch :profile_update
      get :changepassword
      patch :changepassword_update
    end
  end

  root "homes#index"

end
