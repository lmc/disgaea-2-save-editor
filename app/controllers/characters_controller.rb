class CharactersController < InheritedResources::Base
  actions :index, :edit, :update
  
  def update
    update! { edit_character_path(@character) }
  end
  
  
  protected
  
  def resource
    @character = collection[params[:id].to_i] #TODO: Make it so it disassembles as little of the file as possible?
    @character
  end
  
  def collection
    @characters ||= current_disassembled.characters
    @characters
  end
  
end