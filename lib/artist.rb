require 'pry'

class Artist
  @@all = []

  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    songs << song
  end

  def save
    @@all << self
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find { |who| who.name == name }
    # binding.pry
    if artist.nil?
      artist = self.new(name)
    end
    @@all << artist
    artist
  end

  def self.all
    @@all
  end
end
