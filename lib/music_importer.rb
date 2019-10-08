class MusicImporter
  
  def initialize(path) #accepts file path to parse MP3 from
    @path = path
end

def path #go over
  @path #path retrieves the path to the MusicImporter object
end

def files #go back over this
    files = []
    Dir.glob("#{path}/*.mp3").collect do |file|
      files << file.gsub("#{path}/", "")
    end
    files
  end
    
     def import
    # files.each do |filename|
    #   Song.create_from_filename(filename)
    # end
      files.each {|filename| Song.create_from_filename(filename) }
end
end