
# Edited 11/10/2019 by Neel Mansukhani: Added default route to sign up page.
Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
