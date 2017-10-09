Rails.application.routes.draw do
#  get 'group/index'
#  get 'group/show'
#  get 'group/new'
#  get 'group/edit'
#  post 'group/create'
#  get 'group/destroy'
   resources :group
   resources :user do
      resources :group , :expenses
   end
   resources :group do
      resources :expenses
   end 
   root 'group#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
