# File Created 11/09/2019 by Sri Ramya Dandu 
# Edited 11/10/2019 by Neel Mansukhani: Added default route to sign up page.
# Edited 11/12/2019 by Neel Mansukhani: Fixed root routing.
# Edited 11/19/2019 by Leah Gillespie: added route to swipe page
# Edited 11/20/2019 by Neel Mansukhani: Added my_club.
Rails.application.routes.draw do
  
  get 'clubs/choose', to: 'clubs#choose'
  get 'users/index'
  get 'users/stats'
  get 'users/explore'
  get 'users/new'
  get 'users/display_stats'
  get 'users/create'
  get 'users/matched', to: 'users#matched'
  get 'users/not_matched', to: 'users#not_matched'
  post 'users/sign_up', to: 'resources#sign_up'
  get 'club_matches/update'
  get 'interests/new'
  get 'users/my_club', to: 'users#club'
  get 'user_interests/select_user_interests'
  get 'user_interests/handle_check_boxes'
  get 'user_interests/update'
  # get 'user_interests/create'
  # get 'user_interests/destroy'
  get 'users/preferences'
  get 'club_matches/swipe'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :club_matches, :except => [:show,:update] do
    collection do
      patch 'update_current', as: :add_current, to: 'club_matches#update_existing_match'
    end
  end
  resources :clubs
  resources :users
  devise_scope :user do
    authenticated do
      root 'clubs#choose'
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
