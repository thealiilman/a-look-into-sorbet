# typed: true

require 'sorbet-runtime'

class Hello
  extend T::Sig

  sig { returns(String) }
  def self.say_hello_world
    'Hello World'
  end
end
puts Hello.say_hello_world

class Human
  extend T::Sig

  sig { params(name: String).returns(String) }
  def say_hello_to(name)
    "Hallo, #{name}!"
  end

  sig { params(food: String).returns(String) }
  def say_food_i_like_to_eat(food)
    "I like to eat #{food}. 🤓"
  end
end
puts Human.new.say_hello_to('everyone')
puts Human.new.say_food_i_like_to_eat('bitterballen')

class Car
  extend T::Sig

  BRAND_TO_MODEL_MAP = {
    'audi' => 'RS6',
    'bmw' => 'M5',
    'mercedes' => 'E63',
    'mini' => 'Cooper',
    'volvo' => 'V90'
  }.freeze

  sig { params(brand: String).void }
  def initialize(brand)
    @brand = brand.downcase;
  end

  sig { returns(String) }
  def model_name
    BRAND_TO_MODEL_MAP[@brand] || "#{@brand.capitalize} has no models"
  end
end
bmw = Car.new('BMW')
puts bmw.model_name
