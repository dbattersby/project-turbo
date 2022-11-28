Rails.application.routes.draw do
  resources :projects do
    resources :tasks
    post "projects/:project_id/tasks/:task_id/complete" => "tasks#mark_as_complete", as: :task_complete
  end


  devise_for :users

  get 'pages/about', as: :about
  get 'pages/features', as: :features
  get 'pages/contact', as: :contact

  root "pages#home"
end
