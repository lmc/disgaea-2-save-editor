class SaveStorage < ActiveRecord::Base
  has_attached_file :save_file, :styles => { }
  attr_accessible :save_file
  validate :validate_disgaea_save
  
  def validate_disgaea_save
    unless right_filesize? && sensible_header? && sensible_name?
      errors.add(:uploaded_data,"doesn't seem to be an unencrypted, North American Disgaea 2 save")
    end
  end
  
  def right_filesize?
    File.size(save_file_path) == SaveStructure.struct_size
  end
  
  def sensible_timestamp?
    header.timestamp.in_seconds > 0
  rescue
    false
  end
  
  def sensible_name?
    header.name =~ /^Adell|Axel/
  end
  
  protected
  
  def header
    header = SaveHeader.new
    header.disassemble(File.new(save_file_path))
    header
  end
  
  #I hate you paperclip I should have stuck with attachment_fu
  def save_file_path
    new_record? ? save_file.to_file.path : save_file.path
  end
  
end
