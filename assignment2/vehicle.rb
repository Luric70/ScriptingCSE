module Towable 
  def can_tow?(pounds) #returns true / false if over/under 2000 lb
    return pounds ? pounds < 2000 : pounds > 2000
  end
end

class Vehicle
  include Towable #module
  @@number_of_vehicles = 0 #init. class variable

  def initialize(year, model, color, current_speed = 0)
    @year = year
    @model = model
    @color = color
    @current_speed = current_speed
  end

  def speed_up(number) #add arg to current spd
    @current_speed += number
    return "You push the gas and accelerate #{@current_speed} mph."
  end

  def brake(number) #subtract arg to current spd
    @current_speed -= number
    return "You push the brake and decelerate #{@current_speed} mph"
  end

  def current_speed #access current spd
    return "You are now going #{@current_speed} mph"
  end

  def shut_down #change spd to 0
    @current_speed = 0
  end

  def spray_paint(given_color) #change color variable to arg
    @color = given_color
    return "Your new #{@color} paint job looks great!"
  end

  def self.gas_mileage(number1, number2) #num1 = gas num2 = miles
    mpg = (number2/number1).round
    return "#{mpg} miles per gallon of gas"
  end

  
end


class MyCar < Vehicle
  NUMER_OF_DOORS = 4
  def initialize(year, model, color) #copies Vehicle
    super(year, model, color)
    @@number_of_vehicles += 1 #adds 1 vehicle when called
  end

  def shut_down #copies superclass spd = 0 but prints car specific
    super
    return "Lets park the car!"
  end

  def to_s
    return "My car is a #{@color}, #{@year}, #{@model}!"
  end
end

class MyTruck < Vehicle ##copy Vehicle, adds 1 when called
  NUMER_OF_DOORS = 2
  def initialize(year, model, color)
    super(year, model, color)
    @@number_of_vehicles += 1
  end

  def shut_down ##copies superclass spd = 0 but prints truck specific
    super
    return "Lets park the truck!"
  end

  def to_s
    return "My truck is a #{@color}, #{@year}, #{@model}!"
  end
end

#Test case
puts lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina.speed_up(20)
puts lumina.current_speed
puts lumina.speed_up(20)
puts lumina.current_speed
puts lumina.to_s
puts lumina.brake(20)
puts lumina.current_speed
puts lumina.brake(20)
puts lumina.current_speed
puts lumina.shut_down
puts MyCar.gas_mileage(13, 351)
puts lumina.spray_paint("red")
puts ram = MyTruck.new(1990, 'GMC', "black")
puts ram.can_tow?(1000)
puts lumina.can_tow?(3000)