
class Artist 
  
#extend Concerns::Findable
  
  attr_accessor :name
  @@all = []

  
  def initialize(name)
    @name = name
    @songs =[]

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
    self.new(name).tap do |artist|
     # artist.save
    end
  end
  
  def songs
    @songs 
  end
  
  def add_song(song)
  song.artist = self if song.artist == nil
    self.songs << song if self.songs.include?(song) == false
end

def genres 
     
    self.songs.collect {|song| song.genre}.uniq 
    
      # does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs) 
      
          #self.songs.collect {|song| song.genre} 
     
    #returns a collection of genres for all of the artist's songs (artist has many genres through songs)
end
end






