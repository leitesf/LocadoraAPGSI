ActionController::Routing::Routes.draw do |map|
  map.resources :ators, :diretors, :generos, :filmes, :socios, :main
  map.inadimplentes  '/inadimplentes',  :controller => 'socios', :action => 'inadimplentes'
  map.mal_estado  '/mal_estado',  :controller => 'filmes', :action => 'mal_estado'
  map.root :controller => :main
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
