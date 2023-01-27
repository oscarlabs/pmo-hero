Rails.application.routes.draw do
  resources :users

  post "/session/login", to: "session#login"

  resources :project_metrics
  resources :team_members
  resources :teams
  resources :metrics
  resources :projects
  resources :contributors
  resources :roles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
