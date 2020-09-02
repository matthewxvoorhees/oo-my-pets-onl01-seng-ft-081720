class Owner
attr_reader :name, :species

@@all = []

def initialize(name, species="human")
  @name = name
  @species = species
  @@all << self
end

def say_species
  "I am a #{species}."
end

def self.all
  @@all
end

def self.count
  @@all.length
end

def self.reset_all
  @@all.clear
end

def cats 
  Cat.all.select {|owned_cats| owned_cats.owner == self}
end

def dogs 
  Dog.all.select {|owned_dogs| owned_dogs.owner == self}
end

def buy_cat(cat_instance)
  Cat.new(cat_instance, self)
end

def buy_dog(dog_instance)
  Dog.new(dog_instance, self)
end

def walk_dogs
  Dog.all.each {|dogs| dogs.mood = "happy"}
end

def feed_cats
  Cat.all.each {|cats| cats.mood = "happy"}
end

def sell_pets
  Dog.all.each {|dogs| dogs.mood = "nervous"}
  Cat.all.each {|cats| cats.mood = "nervous"}
  Dog.all.each {|dogs| dogs.owner = nil}
  Cat.all.each {|cats| cats.owner = nil}
end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end


end
