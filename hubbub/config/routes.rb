# File Created 11/09/2019 by Sri Ramya Dandu 
# Edited 11/10/2019 by Neel Mansukhani: Added default route to sign up page.
# Edited 11/12/2019 by Neel Mansukhani: Fixed root routing.
# Edited 11/19/2019 by Leah Gillespie: added route to swipe page
# Edited 11/20/2019 by Neel Mansukhani: Added my_club.
# Edited 11/21/2019 by Neel Mansukhani: Fixed root routing
Rails.application.routes.draw do
  
  get 'clubs/choose', to: 'clubs#choose'
  get 'users/index'
  get 'users/stats'
  get 'users/explore'
  get 'users/new'
  get 'users/display_stats'
  get 'users/create'
  get 'users/matched/:id', to: 'users#matched'
  get 'users/not_matched/:id', to: 'users#not_matched'
  post 'users/sign_up', to: 'resources#sign_up'
  #get 'club_matches/update'
  get 'interests/new'
  get 'clubs/my_club', to: 'clubs#my_club'
  get 'user_interests/select_user_interests'
  get 'club_interests/select_club_interests'
  get 'user_interests/handle_check_boxes'
  get 'club_interests/handle_check_boxes'
  get 'user_interests/update'
  # get 'user_interests/create'
  # get 'user_interests/destroy'
  get 'users/preferences'
  get 'club_matches/swipe'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  resources :club_matches, :except => [:show,:update] do
    collection do
      patch 'club_matches/update_current/:id', as: :add_current, to: 'club_matches#update_existing_match'
    end
  end
  resources :clubs
  resources :users
  devise_scope :user do
    authenticated do
      root 'users#root'
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
