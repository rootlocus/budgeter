Rails.application.routes.draw do
  get 'user_groups/new'

  get 'user_groups/create'

  get 'user_groups/destroy'

  devise_for :users
  get 'home/index'

#  get 'group/index'
#  get 'group/show'
#  get 'group/new'
#  get 'group/edit'
#  post 'group/create'
#  get 'group/destroy'
   resources :group
   resources :group do
      resources :expenses
#      resources :usergroups
   end

   resources :users do
      resources :user_groups
   end
   root 'home#index'
#   root 'group#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
