class String
  def read(bytes = size)
    @read ||= split(//)
    output = ""
    bytes.times { output << @read.shift }
    output
  end
  
  def write(data)
    self << data
  end
end