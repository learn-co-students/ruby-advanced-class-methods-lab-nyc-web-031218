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

    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
        # song = Song.new(name)
      song  =  self.new
      song.name = song_name
      song
      #Song.new_by_name
      # song.name = @name
      # name.save
      # name

  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
      self.all.detect do |s|
          s.name == song_name

      end

  end

  def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
      self.all.sort_by do |song|
        song.name
      end
  end

  def self.new_from_filename(filename)
      # binding.pry
     old_format = filename.split(' - ')
      song_name = old_format[1].gsub(".mp3", "")
      a_name = old_format[0]
      song = self.new_by_name(song_name)
      song.artist_name = a_name
      song
  end

  def self.create_from_filename(filename)
    old_format = filename.split(' - ')
     song_name = old_format[1].gsub(".mp3", "")
     a_name = old_format[0]
     song = self.create_by_name(song_name)
     song.artist_name = a_name
     song
  end

  def self.destroy_all
      self.all.clear
  end


end
