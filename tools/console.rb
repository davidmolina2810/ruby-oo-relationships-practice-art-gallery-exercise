require_relative '../config/environment.rb'

ash = Artist.new("Ash", 10)
david = Artist.new("David", 5)
jorge = Artist.new("Jorge", 6)

houston = Gallery.new("MFA", "Houston")
nyc = Gallery.new("NYCFA", "New York City")
paris = Gallery.new("The Louvre", "Paris")

p1 = Painting.new("Ocean", 500, david, nyc)
p2 = Painting.new("Life", 10000000, ash, paris)
p3 = Painting.new("Wood", 3000000, ash, houston)
p4 = Painting.new("Gun", 40, jorge, paris)
p5 = Painting.new("Air", 50000000000000, david, houston)


binding.pry

puts "Bob Ross rules."
