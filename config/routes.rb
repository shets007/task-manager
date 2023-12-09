Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/task/new", to: "task#new", as: :new_task
  get "/task/:id", to: "task#show", as: :task
  patch "/task/:id", to: "task#update", as: :update_task
  delete "/task/:id", to: "task#destroy"
  get "/task/:id/edit", to: "task#edit", as: :edit_task
  post "/task", to: "task#create", as: :tasks

  root "task#index"
end
