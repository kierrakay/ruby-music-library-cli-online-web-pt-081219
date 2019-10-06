class Genre 
  
  
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
    save
  end
  
  def self.all
    @@all 
  end 
  
    
  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self 
  end 
  
  def self.create(name)
    self.new(name).tap do |genre|
    genre.save
    end
  end
  
  def songs
    @songs
  end
  
  def artists 
     songs.collect {|song| song.artist}.uniq 
end
end