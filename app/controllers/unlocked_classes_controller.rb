class UnlockedClassesController < InheritedResources::Base
  actions :index
  
  def collection
    @unlocked_classes ||= current_disassembled.unlocked_classes
    @unlocked_classes
  end
  
end