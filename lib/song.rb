require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
  end

  def self.create
    song = Song.new()
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    @@all << song
    return song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    return @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    arr = name.split(" - ")
    return Song.new(arr[1].chomp(".mp3"),arr[0])
  end

  def self.create_from_filename(name)
    song = new_from_filename(name)
    @@all << song
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
