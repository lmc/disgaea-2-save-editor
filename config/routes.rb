ActionController::Routing::Routes.draw do |map|
  map.root      :controller => 'index'
  map.resource  :save_headers,  :only => [:edit,:update]
  map.resources :characters,    :only => [:edit,:update,:index],
    :has_many => [:items,:weapon_skills]
    
  map.resources :save_storages
end
