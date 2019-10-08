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
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(filename)
    # song_name = filename.split(" - ")[1]
    # artist_name = filename.split(" - ")[0]
    # genre_name = filename.split(" - ")[2].chomp(".mp3")

    # song = self.find_or_create_by_name(song_name)

    # song.artist = Artist.find_or_create_by_name(artist_name)

    # song.genre = Genre.find_or_create_by_name(genre_name)
    # song
    
      #create song and assign artist and genre attribute, & create connections
    #prevent the creation of duplicate objects: songs, artists, genres
    
    
    
    
    
        split_file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2])
    self.new(split_file[1], artist, genre)
  end
  
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)

  end
  end  
 