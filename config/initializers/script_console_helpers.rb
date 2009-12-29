def sve
  Save.new.disassemble
end

def cs
  sve.characters
end

def read_save(slot = 0)
  Save.new(RAILS_ROOT+"/data/saves/ULUS10461DISGAEA00#{slot}/SDDATA.BIN").disassemble
end

def write_save(save_object,slot = 5)
  file = File.open("/Volumes/BONERTOWN/PSP/SAVEPLAIN/ULUS10461DISGAEA00#{slot}/SDDATA.BIN",'w') do |f|
    save_object.structures.assemble(f)
  end
end