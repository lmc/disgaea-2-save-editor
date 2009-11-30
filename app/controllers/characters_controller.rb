class CharactersController < InheritedResources::Base
  actions :index, :edit, :update
  
  
  protected
  
  def collection
    @characters ||= current_save.disassemble.characters
    @characters
  end
  
end