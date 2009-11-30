class SaveHeadersController < InheritedResources::Base
  actions :show, :edit, :update
  
  
  protected
  
  def resource
    @save_header ||= current_save.disassemble.header
    @save_header
  end
  
end