# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def current_save
    @file = RAILS_ROOT+'/data/saves/ULUS10461DISGAEA000/SDDATA.BIN'
    @current_save ||= Save.new(@file)
  end
  
  def current_disassembled
    @current_disassembled ||= current_save.structures
    @current_disassembled
  end
  
end
