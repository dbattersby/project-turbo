Rails.application.routes.draw do
  resources :projects
  devise_for :users

  get 'pages/about', as: :about
  get 'pages/features', as: :features
  get 'pages/contact', as: :contact

  root "pages#home"
end
