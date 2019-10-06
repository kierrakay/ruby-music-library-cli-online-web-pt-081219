module Concerns::Findable 
  
def find_by_name(name)
    all.find {|song| song.name == name} #wont hard code
 #@@all.find {|song| song.name == name} #will hard code
  end 
  
  def  find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
end
end