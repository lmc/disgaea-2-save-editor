class SaveStoragesController < InheritedResources::Base
  
  def index
    @save_storage = SaveStorage.new
    index!
  end
  
  def make_active
    @save_storage = resource
    self.current_save_storage = @save_storage
    flash[:success] = "Save ready for editing"
    redirect_to characters_path
  end
  
  def create
    create! do
      self.current_save_storage = @save_storage
      characters_path
    end
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