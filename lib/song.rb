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

  def self.new_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(song_name)
    # binding.pry
    if find_by_name(song_name)
      return find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end

  def self.alphabetical
    # binding.pry
    sorted_array = @@all.sort_by{ |song| song.name}
    sorted_array.uniq
  end

  def self.new_from_filename(filename)
    filename_parts = filename.split(/[-.]/)
    
    # binding.pry
    song = self.new
    song.name = filename_parts[1].strip
    song.artist_name = filename_parts[0].strip
    song.save
    song
  end


  def self.create_from_filename(filename)
    filename_parts = filename.split(/[-.]/)
    
    # binding.pry
    song = self.new
    song.name = filename_parts[1].strip
    song.artist_name = filename_parts[0].strip
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
