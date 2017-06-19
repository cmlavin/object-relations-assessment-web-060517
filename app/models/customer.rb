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
