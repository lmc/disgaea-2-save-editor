class MapsController < InheritedResources::Base
  actions :index
  
  def collection
    @maps ||= current_disassembled.maps
    @maps
  end
  
end