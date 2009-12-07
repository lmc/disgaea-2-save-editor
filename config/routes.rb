ActionController::Routing::Routes.draw do |map|
  map.resource  :save_headers,  :only => [:edit,:update]
  map.resources :characters,    :only => [:edit,:update,:index], :has_many => [:items]
end
