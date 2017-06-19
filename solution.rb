# Please copy/paste all three classes into this file to submit your solution!
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

class Customer
  attr_accessor :first_name, :last_name, :restaurant, :review
  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    var = name.split
    self.all.select do |cust_name|
      cust_name.first_name == var[0] && cust_name.last_name == var[1]
    end.join(' ')
  end

  def self.find_all_by_first_name(name)
    self.all.find do |cust_name|
      cust_name.first_name == name
    end
  end

  def self.all_names
    self.all.map do |cust|
      cust.full_name
    end
  end

  def add_review(restaurant, content)
    new_review = Review.new(content)
    new_review.restaurant = restaurant
    new_review.customer = self
  end
end

class Review
  attr_accessor :customer, :restaurant, :content
  @@all = []

  def initialize(content)
    @content = content
  end

  def self.all
    @@all
  end

  def customer
    self.all.find do |cust|
      cust.review == self
    end
  end

  def restaurant
    self.all.find do |rest|
      rest.review == self
    end
  end
end
