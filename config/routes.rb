Rails.application.routes.draw do
  devise_for :users
  resources :tasks do
    collection do
      Task.statuses.keys.each do |status|
        get status
      end
      get :canceled
    end
    get :retry
    member do
      post :cancel
    end
  end
  resources :workers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/new_task", to: "tasks#new_task_for_worker"
  get "/tasks_canceled", to: "tasks#tasks_canceled"
  post "/update_task", to: "tasks#update_task"

  root to: 'tasks#index'
end
