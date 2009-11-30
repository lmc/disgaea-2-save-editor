class SaveHeadersController < InheritedResources::Base
  actions :edit, :update
  
  
  protected
  
  def resource
    @save_header ||= current_save.disassemble.header
    @save_header
  end
  
end