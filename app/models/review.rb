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
