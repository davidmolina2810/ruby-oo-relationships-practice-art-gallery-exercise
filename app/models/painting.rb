class Painting

  attr_reader :title, :price
  attr_accessor :artist, :gallery

  @@all = [] # holds all instances of Painting

  def initialize(title, price, artist, gallery)
    @title = title
    @price = price
    @artist = artist
    @gallery = gallery
    @@all << self # on initialize, add self-painting to all instances of Painting
  end

  def self.all # returns all instances of Painting
    return @@all
  end

  def self.total_price # returns sum value of all paintings
    return Painting.all.sum {|painting| painting.price}
  end

end
