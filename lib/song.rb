require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song)
    new_song = Song.new
    new_song.name = song
    @@all << new_song
    new_song
  end

  def self.create_by_name(song)
    new_song = Song.new
    new_song.name = song
    @@all << new_song
    new_song
  end

  def self.find_by_name(song)
    @@all.find { |s| s.name == song }
  end

  def self.find_or_create_by_name(song)
    s = find_by_name(song)
    if !s
      create_by_name(song)
    else
      s
    end
  end

  def self.alphabetical
    @@all.sort { |s,t| s.name <=> t.name }
  end

  def self.new_from_filename(file)
    new_song = Song.new
    new_song.name = file.split(' - ')[1][0..-5]
    new_song.artist_name = file.split(' - ')[0]
    new_song
  end

  def self.create_from_filename(file)
    new_song = Song.new
    new_song.name = file.split(' - ')[1][0..-5]
    new_song.artist_name = file.split(' - ')[0]
    @@all << new_song
    new_song
    # binding.pry
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
