Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

   resources :group
   resources :group do
      resources :expenses
      resources :user_groups
   end
   resources :user_groups
   root 'home#index'
#   root 'group#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
