class Restaurant
  attr_accessor :name, :review, :customer
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find do |rest_name|
      rest_name.name == name
    end
  end

  def reviews
    Review.all.select do |rev|
      rev.restaurant == self
    end
  end

  def customers
    Review.all.select do |rev|
      rev.customer == customer
    end
  end
end
