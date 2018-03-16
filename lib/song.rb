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
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song)
    arr = []
    arr = song.split(' - ')
    song_artist = arr[0]
    arr2 = arr[1].split('.')
    song_name = arr2[0]
    song = self.new_by_name(song_name)
    song.name = song_name
    song.artist_name = song_artist
    song
  end

  def self.create_from_filename(song)
    arr = []
    arr = song.split(' - ')
    song_artist = arr[0]
    arr2 = arr[1].split('.')
    song_name = arr2[0]
    song = self.create_by_name(song_name)
    song.name = song_name
    song.artist_name = song_artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
