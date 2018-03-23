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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = Song.create
    song.name = title
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |title|
      title.name
    end
  end

  def self.new_from_filename(file)
    split = file.split(" - ")
    split2 = split[1].split(".")

    file_artist = split[0]
    file_song = split2[0]

    # binding.pry

    new_song = self.new
    new_song.name = file_song
    new_song.artist_name = file_artist
    new_song
  end

  def self.create_from_filename(file)
    split = file.split(" - ")
    split2 = split[1].split(".")

    file_artist = split[0]
    file_song = split2[0]

    new_song = self.create
    new_song.name = file_song
    new_song.artist_name = file_artist
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
