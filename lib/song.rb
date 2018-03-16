
require 'pry'

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.create_by_name(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

 def self.alphabetical
   self.all.sort_by{ |song| song.name }
 end

 def self.new_from_filename(filename)
   song_and_artist = filename.split(" - ")
   name = song_and_artist[1].gsub(".mp3", "")
   artist_name = song_and_artist[0]
   song = self.new
   song.name = name
   song.artist_name = artist_name
   song
end


 def self.create_from_filename(filename)
   song_and_artist = filename.split(" - ")
   name = song_and_artist[1].gsub(".mp3", "")
   artist_name = song_and_artist[0]
   song = self.create
   song.name = name
   song.artist_name = artist_name
   song
end

  def self.destroy_all
    self.all.clear
  end 

  def save
    self.class.all << self
  end

end
