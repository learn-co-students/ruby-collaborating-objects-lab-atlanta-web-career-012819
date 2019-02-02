require 'pry'

class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
    # binding.pry
  end

  def files
    filenames = Dir.glob("#{path}/*.mp3")
    filenames.collect { |name| name.gsub("#{path}/", "") }
    # binding.pry
  end

  def import
    self.files.collect { |filename| Song.new_by_filename(filename) }
  end
end
