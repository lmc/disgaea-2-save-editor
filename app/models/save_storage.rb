class SaveStorage < ActiveRecord::Base
  has_attached_file :save_file, :styles => { }
  attr_accessible :save_file
  
  def valid_disgaea_save?
    
  end
end
