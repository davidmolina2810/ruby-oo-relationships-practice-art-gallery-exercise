class Gallery

  attr_reader :name, :city

  @@all = [] # holds all instances of Gallery

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self # on initialize, add self-galleria to all instances of Gallery
  end

  def paintings # returns array of all painting instances in self-gallery
    return Painting.all.select {|painting| painting.gallery == self}
  end

  def artists # returns array of all artists instances that have a painting in self-gallery
    return paintings.map {|painting| painting.artist}
  end

  def artist_names # returns names of artist instances that have a painting in self-gallery
    return artists.map {|artist| artist.name}
  end
  
  def most_expensive_painting # returns most expensive painting instance in self-gallery
    return paintings.max {|painting1, painting2| painting1.price <=> painting2.price}
  end

  def self.all # returns all instances of Gallery
    return @@all
  end


end
