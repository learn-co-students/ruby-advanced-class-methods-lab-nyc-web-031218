class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@names = []

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def initialize(name="no_name_set", artist="no_artist_set")
    @name = name
    @artist_name = artist
  end

  def self.new_by_name(name, artist = "no_artist_given")
    song = Song.new(name, artist)
    song
  end

  def self.create_by_name(name = "no_name_set", artist = "no_artist_set")
    song = self.new_by_name(name, artist)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      self.create_by_name(name)
      self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort{|song1, song2| song1.name <=> song2.name}
  end

  def self.read_file(file_name)
    song = file_name.split(/ - |\./)
    artist = song[0]
    song_name = song [1]
    song = {artist => song_name}
  end

  def self.new_from_filename(file_name)
    song_data = read_file(file_name)
    song = self.new_by_name(song_data.values[0], song_data.keys[0])
  end

  def self.create_from_filename(file_name)
    song_data = read_file(file_name)
    song = self.create_by_name(song_data.values[0], song_data.keys[0])
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
