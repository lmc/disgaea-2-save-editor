ActionController::Routing::Routes.draw do |map|
  map.root      :controller => 'save_storages'
  
  map.resource  :save_headers,  :only => [:edit,:update]
  
  map.resources :characters,    :only => [:edit,:update,:index],
    :has_many => [:items,:weapon_skills]
    
  map.resources :items
    
  map.resources :save_storages, :member => { :make_active => :post }
  
  map.resources :unlocked_classes, :only => [:index]
  map.resources :maps,             :only => [:index]
end
