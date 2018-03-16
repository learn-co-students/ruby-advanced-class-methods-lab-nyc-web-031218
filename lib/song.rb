require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name, artist = "")
    song = self.new
    song.name = name
    #song.artist_name = artist
    @@all << song
    song
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name) == name
    # else
    # create_by_name(name)
    # end
    # self.find_by_name(name) || self.create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|object| object.name}
  end

  def self.new_from_filename(name)
    name.slice! ".mp3"
    artist_name, song_name = name.split(" - ")
    # puts "#{artist_name} as the artist"
    # puts "#{song} as the song"

    song = self.new_by_name(song_name)
    #song.name = song_name
    song.artist_name = artist_name
    song
    # @song = song
    # @artist = artist_name
    # self.create_by_name(@song, @artist)
    # #puts self.find_by_name(song)
    #song.artist_name = artist_name
  end

  def self.create_from_filename(name)
    name.slice! ".mp3"
    artist_name, song_name = name.split(" - ")
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all = []
    #self.all.clear
  end

end
