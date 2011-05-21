ZPionka::Application.routes.draw do
  get "tomaiframes/new"

  get "tomaiframes/create"

  get "tomaiframes/edit"

  get "tomaiframes/update"

  get "tomaiframes/show"

  get "tomaiframes/index"

  get "tomaiframes/delete"

  get "movecomments/new"

  get "movecomments/create"

  get "movecomments/index"

  get "movecomments/update"

  get "movecomments/edit"

  get "movecomments/destroy"

  get "uploads/new"

  get "uploads/index"

  get "uploads/show"

  get "uploads/create"

  get "uploads/destroy"

  get "newsletters/new"

  get "newsletters/create"

  get "newsletters/edit"

  get "newsletters/update"

  get "newsletters/show"

  get "newsletters/index"

  get "newsletters/send"

  get "zpawn/new"

  get "zpawn/create"

  get "zpawn/edit"

  get "zpawn/update"

  get "zpawn/index"

  get "zpawn/destroy"
  
  get "zpawn/show"

  get "pgn/add_pgn"

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
  
  get "games/read_pgn_file"

  get "games/update"

  get "players/new"

  get "players/create"
  
  get "players/list_all_games"

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

  get "tournaments/add_to_observed_and_redirect"
  
  get "tournaments/add_to_observed_games"
  
  get "tournaments/remove_from_observed_and_redirect"

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
  
  get "info/delete"

  get "info/edit"
  get "user/new"
  get "user/create"
  get "user/update"
  get "user/edit"
  get "user/destroy"
  get "user/index"  
  get "info/index_user"
  get "session/new"
  get "page/home"
  
resources :tomaiframes 
resources :movecomments
resources :uploads 
resources :newsletters 
resources :allowances
resources :players
resources :zpawns
resources :tourchats
resources :gamechats
resources :tournaments
resources :tourplaces
resources :rounds
resources :comments  
resources :messages  
resources :users
resources :infos
resources :games
resources :sessions, :only => [:new, :create, :destroy]

match 'games/movecomments', :to => "games#_movecomment"
match 'games/variations', :to => "games#_variations"
match 'user_send_message', :to => "users#mail_index"
match '/delete_comment', :to => "comments#destroy"
match '/signout', :to => "sessions#destroy"
match '/userlist', :to => "users#index" 
match '/infolist', :to => "infos#index" 
match '/add_to_observed_and_redirect', :to => "tournaments#add_to_observed_and_redirect"
match '/remove_from_observed_and_redirect', :to => "tournaments#remove_from_observed_and_redirect"
match '/add_to_observed_round_and_redirect', :to => "tournaments#add_to_observed_round_and_redirect"
match '/remove_from_observed_round_and_redirect', :to => "tournaments#remove_from_observed_round_and_redirect"
match '/add_to_observed_games', :to => "tournaments#add_to_observed_games"
match '/remove_from_observed_games', :to => "tournaments#remove_from_observed_games"
match '/list_all_games', :to => "players#list_all_games"

match '/unread_messages', :to => "messages#index"
match '/index_user', :to => "infos#index_user"
match '/add_pgn', :to => "pgn#add_pgn"
match '/parse_pgn', :to =>"pgn#parse_pgn"
match '/change_allowance', :to => "allowances#new"
match '/user_list', :to => "users#index"
match '/change_and_create', :to =>"allowances#change_and_create"


 root :to => "tournaments#index"


end
