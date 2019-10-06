  require 'pry'

class Song 
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name,artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    save
  end
  

  def self.all 
   @@all 
  end
  
  def self.destroy_all
   @@all.clear
  end

  def save
    @@all << self 
  end 
  
  def self.create(name)
    self.new(name).tap do |song|
     # song.save dont need otherwise song being save in too many places we have the save method to do this.
    end
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
      if !(genre.songs.include?(self))
      genre.songs << self
  end
end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}

  end 
  
  def self.find_or_create_by_name(name)
   #self.all.find_or_create_by_name(name)? self.all.find_by_or_create_by_name(name):  Artist.new(name)
   find_by_name(name) || create(name)
  
  end
  end  
 