class Song

	attr_accessor :name
	attr_reader :artist

	def initialize(name)
		@name = name
		@artist = nil
	end

	def artist=(artist_object)
		artist_object.add_song(self)
		@artist = artist_object
	end 

	def self.new_by_filename(filename)
		arr = filename.split(" - ")
		song = self.new(arr[1])
		song.artist = Artist.find_or_create_by_name(arr[0])
		song
	end

end