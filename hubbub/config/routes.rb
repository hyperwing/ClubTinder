# File Created 11/09/2019 by Sri Ramya Dandu 
# Edited 11/10/2019 by Neel Mansukhani: Added default route to sign up page.
# Edited 11/12/2019 by Neel Mansukhani: Fixed root routing.
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :clubs

  devise_scope :user do
    authenticated do
      root 'clubs#index'
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
