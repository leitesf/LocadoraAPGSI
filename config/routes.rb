ActionController::Routing::Routes.draw do |map|
  map.resources :ators, :diretors, :generos, :filmes, :socios
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
