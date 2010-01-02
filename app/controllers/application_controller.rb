# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :initialize_session
  
  def current_save
    @file = current_save_storage.save_file.path
    @current_save ||= Save.new(@file)
    @current_save
  end
  
  def ensure_current_save
    unless current_save
      flash[:notice] = "Please upload or choose a save file"
      redirect_to save_storages_path
    end
  end
  
  def current_save_storage
    SaveStorage.scoped_by_session_id(session[:session_id]).find(session[:save_storage_id]) rescue nil
  end
  helper_method :current_save_storage
  
  def current_save_storage=(save_storage)
    session[:save_storage_id] = save_storage.id
  end
  
  def current_disassembled
    @current_disassembled ||= current_save.structures
    @current_disassembled
  end
  
  def initialize_session
    session[:files] ||= []
  end
  
end
