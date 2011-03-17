ZPionka::Application.routes.draw do
  get "allowances/new"

  get "allowances/edit"

  get "allowances/destroy"

  get "observes/new"

  get "observes/create"

  get "observes/destroy"

  get "observes/show"

  get "observes/index"

  get "gamechats/new"

  get "gamechats/create"

  get "gamechats/edit"

  get "gamechats/update"

  get "gamechats/show"

  get "gamechats/index"

  get "gamechats/destroy"

  get "positions/new"

  get "positions/create"

  get "positions/edit"

  get "positions/update"

  get "positions/index"

  get "positions/show"

  get "positions/destroy"

  get "rounds/new"

  get "rounds/create"

  get "rounds/update"

  get "rounds/edit"

  get "rounds/show"

  get "rounds/index"

  get "rounds/destroy"

  get "games/new"

  get "games/create"

  get "games/edit"

  get "games/destroy"

  get "games/index"

  get "games/show"

  get "games/update"

  get "players/new"

  get "players/create"

  get "players/edit"

  get "players/update"

  get "players/show"

  get "players/index"

  get "players/destroy"

  get "tourplaces/new"

  get "tourplaces/create"

  get "tourplaces/edit"

  get "tourplaces/update"

  get "tourplaces/show"

  get "tourplaces/indez"

  get "tourplaces/destroy"

  get "tourchats/new"

  get "tourchats/create"

  get "tourchats/index"

  get "tourchats/show"

  get "tourchats/edit"

  get "tourchats/update"

  get "tourchats/destroy"

  get "tournaments/new"

  get "tournaments/create"

  get "tournaments/edit"

  get "tournaments/update"

  get "tournaments/show"

  get "tournaments/index"

  get "tournaments/destroy"

  get "comment/new"

  get "comment/create"

  get "comment/update"

  get "comment/edit"

  get "comment/show"

  get "comment/index"

  get "comment/destroy"

  get "messages/new"

  get "messages/create"

  get "messages/edit"

  get "messages/update"

  get "messages/index"

  get "messages/show"

  get "messages/destroy"

  get "info/new"

  get "info/create"

  get "info/show"

  get "info/index"

  get "info/update"

  get "info/destroy"

  get "info/edit"
  get "user/new"
  get "user/create"
  get "user/update"
  get "user/edit"
  get "user/destroy"
  get "session/new"
  get "page/home"
  
  
resources :tourchats
resources :tournaments
resources :comments  
resources :messages  
resources :users
resources :infos
resources :sessions, :only => [:new, :create, :destroy]


match '/signout', :to => "sessions#destroy"
match '/userlist', :to => "users#index" 
match '/infolist', :to => "infos#index" 
match '/add_to_observed_and_redirect', :to => "tournaments#add_to_observed_and_redirect"
match '/remove_from_observed_and_redirect', :to => "tournaments#remove_from_observed_and_redirect"
match 'unread_messages', :to => "messages#index"



 root :to => "tournaments#index"


end
