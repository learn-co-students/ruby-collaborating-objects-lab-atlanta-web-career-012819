class MP3Importer

	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		Dir["#{@path}/**/*.mp3"].map { |file| file[/(?<=mp3s\/).*/]}
	end

	def import
		self.files.each { |file| Song.new_by_filename(self) }
	end

end

# blah = MP3Importer.new('./spec/fixtures')
# puts blah.files