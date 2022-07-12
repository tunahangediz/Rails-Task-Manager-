Rails.application.routes.draw do
  # get 'pages/home'
  devise_for :users
  post "tasks", to: "tasks#create"
  get "tasks/new", to: "tasks#new"
  patch "tasks/:id", to:"tasks#update", as: :update_task
  put "tasks/:id", to:"tasks#update_two", as: :update_task_two
  get "tasks/:id", to:"tasks#show", as: :show_task
  delete "tasks/:id", to:"tasks#destroy", as: :destroy_task

  get "/tasks/:id/edit", to: "tasks#edit", as: :edit_task

  get "/admin", to: "pages#admin"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
