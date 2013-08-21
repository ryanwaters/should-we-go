Shouldwego::Application.routes.draw do

  root :to => 'home#home'
  get '/home' => 'home#home'

  get '/how_to_use' => 'home#how_to_use'
  get '/about' => 'home#about'

  post '/search_mountain' => 'mountain#search'
  post '/search_surf' => 'surf#search'

  
end
