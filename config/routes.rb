Rails.application.routes.draw do
  devise_for :users
  resources :tasks do
    get :retry
  end
  resources :workers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/new_task", to: "tasks#new_task_for_worker"
  post "/update_task", to: "tasks#update_task"

  root to: 'tasks#index'
end
