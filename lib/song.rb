require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    # binding.pry
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
    # binding.pry
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    # binding.pry
    self.all.detect do |find|
      find.name == name ? find.name : false
    end
    # finder.uniq.to_s
  end

  def self.find_or_create_by_name(name)
    # binding.pry
  self.find_by_name(name) || self.create_by_name(name)

  end

  def self.alphabetical
    # binding.pry
    self.all.sort_by do |object_name|
      object_name.name
      # binding.pry
    end
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    # binding.pry
    parts= filename.split(" - ")
    song = self.create
    song_name_only = parts[1].split(".")
    song.name = song_name_only[0]
    song.artist_name = parts[0]
    song
    # binding.pry
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song
    # binding.pry
  end

end
