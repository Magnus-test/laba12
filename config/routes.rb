Rails.application.routes.draw do
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users
  get 'palindrome/input'
  get 'palindrome/view'
  get 'palindrome/showDB'
  root 'palindrome#input'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
