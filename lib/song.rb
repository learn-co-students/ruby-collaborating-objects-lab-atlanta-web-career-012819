require 'pry'

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    filename.chomp!('.mp3')
    data = filename.split(' - ')
    song = self.new(data[1])
    song.artist = Artist.find_or_create_by_name(data[0])
    song.artist.songs << song
    # binding.pry
    song
  end
end
