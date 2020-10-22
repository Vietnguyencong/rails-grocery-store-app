Rails.application.routes.draw do
  root 'stores#index'
  resources :reviews
  resources :employees
  resources :departments
  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
