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
    # binding.pry
    song

  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)

    Song.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)? self.find_by_name(name) : self.create_by_name(name)
  end

  # @memberships.sort_by!{ |m| m.group.name.downcase }

  def self.alphabetical
    @@all.sort_by! { |song| song.name}

  end
  # self.name.split(" ").collect{|w| w.capitalize}.join(" ")
  # "Thundercat - For Love I Come.mp3"


  def self.new_from_filename(filename)


  end

  def self.destroy_all
    self.all.clear

  end


end
