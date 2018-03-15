require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.alphabetical
    @@all.sort_by do |e|
      e.name
    end
  end

  def self.find_by_name (name)
    @@all.find { |song| song.name == name  }
  end

  def self.find_or_create_by_name (name)
    song = self.find_by_name(name)
    if song
      song
    else
      song = Song.create_by_name(name)
    end
  end

  def self.new_from_filename (file)
    file = file.split ("-")
    artist_name = file[0].strip
    file = file[1][0..-5].strip
    song = Song.new_by_name(file)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename (file)
    file = file.split ("-")
    artist_name = file[0].strip
    file = file[1][0..-5].strip
    song = Song.find_or_create_by_name(file)
    song.artist_name = artist_name
  end

end
