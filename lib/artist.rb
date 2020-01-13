require 'pry'

class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select { |song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
    # binding.pry
  end

  def self.find_by_name(name)
    @@all.find { |artist| artist.name == name }
  end

  def self.create_by_name(name)
    Artist.new(name)
  end


  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def print_songs
    songs.each { |song| puts song.name }
  end

end
