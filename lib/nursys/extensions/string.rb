class String
  def keyify
    self.split('_').map{|chr| chr.upcase_first }.join('')
  end
end