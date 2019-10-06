class Song 
  
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name,artist=nil, genre=nil)
    @name = name
    @@all << self 
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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
    self.new(name).tap do |song|
      song.save
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
    self.all.find {|song| song.name == name}
     # self.all.detect {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
 self.find(name)? self.find(name):  Artist.new(name) 
  end
  end  
 