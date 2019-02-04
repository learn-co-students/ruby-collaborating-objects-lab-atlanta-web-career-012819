class Artist

	attr_accessor :name, :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def add_song(song)
		self.songs << song
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.find_or_create_by_name(artist_name)
		if self.all.map { |a| a.name }.include?(artist_name)
			self.all.find { |a| a.name == artist_name }
		else
			a = self.new(artist_name)
			@@all << a
			a
		end
	end

	def print_songs
		puts self.songs.map { |s| s.name }
	end

end