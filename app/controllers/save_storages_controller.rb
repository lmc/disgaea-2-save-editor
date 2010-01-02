class SaveStoragesController < InheritedResources::Base
  
  def index
    @save_storage = SaveStorage.new
    index!
  end
  
  protected
  
  def build_resource
    object = super
    object.session_id = session[:session_id]
    object
  end
  
  def collection
    @save_storages ||= end_of_association_chain.scoped_by_session_id(session[:session_id])
    @save_storages
  end
end