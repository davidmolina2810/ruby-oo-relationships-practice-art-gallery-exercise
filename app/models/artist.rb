class Artist

  attr_reader :name, :years_experience

  @@all = [] # holds all instances of Artist

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self # add self-artist to all instances of Artist
  end

  def paintings # returns all paintings by self-artist
    return Painting.all.select {|painting| painting.artist == self}
  end

  def galleries # returns all galleries self-artist has paintings in
    return paintings.map {|painting| painting.gallery}
  end

  def cities # returns array of cities self-artist has paintings in 
    return galleries.map {|gallery| gallery.city}
  end

  def create_painting(title, price, gallery) # creates new painting instance linking self-artist to gallery and return paintings of self-artist
    Painting.new(self, title, price, gallery)
    return paintings
  end

  def self.all # returns all instances of Artist
    return @@all
  end

  def self.total_experience # returns sum of experience of all Artist
    return Artist.all.sum {|artist| artist.years_experience}
  end

  def self.most_prolific # returns artist with highest total number of paintings to years of experience ratio
    paint_to_experience = Artist.all.each_with_object(Hash.new(0)) {|artist, hash| hash[artist] = artist.paintings.length / artist.years_experience .to_f} # create hash where key is artist instance and value is ratio (num of paintings / years experience)
    if paint_to_experience.values == paint_to_experience.values.uniq # if there are no repeating ratios for the artists
      return paint_to_experience.max {|(key1,val1),(key2,val2)| val1 <=> val2} # return artist with max ratio
    else                                                             # else two or more artists have same num of paintings / years experience ratio
      max_ratio = paint_to_experience.values.max # determine what the max ratio is 
      return paint_to_experience.select {|artist, ratio| ratio == max_ratio} # return all artists whose ratios match max_ratio
    end
  end


end
