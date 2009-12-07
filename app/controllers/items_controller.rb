class ItemsController < InheritedResources::Base
  actions :index
  
  
  protected
  
  #def collection
  #  @characters ||= current_save.disassemble.characters
  #  @characters
  #end

end