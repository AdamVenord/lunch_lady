require "pry"
require "colorize"

class Lunch
  
  def initialize
    @plate = []
    @maindishes = [
    "Sonics Hamburger",
    "Swiss Spagetti",
    "Russian pizza",
    "Chinese Meatballs",
    "Coded Clouds"

    ]
    @sidedishes = [
      "Spanish Fries",
      "Turkish Grilled Cheese", 
      "Japenese Fried Bean Soup",
      "Egyptian Cupcakes"
    ]
    menu
  end 

    def menu
      puts "-- Lunch Room --"
      puts "1) Pick some food"
      puts "2) See What we got"
      puts "3) pay (if you're getting something)"
      puts "4) Leave"
      choice = gets.strip
  
      case choice
        when "1"
           Dishes.new(@maindishes, @sidedishes, @plate)
        when "2"
          view_dishes
        when "3"
          order_total
        when "4"
          puts "Come Again"
          exit
        when "5"
        else
          puts "Excuse me?"
      end  
    end

    def order_total
      puts "Your total is"
      puts @cart.map {|x| x.value[1]}.sum
    end
   
    def view_dishes
      puts " "
      puts "Heres the main dishes"
      @maindishes.each_with_index {|answer, i| puts " #{i + 1} #{answer.colorize(:cyan)}"}
      puts " "
      puts "Heres the side dishes"
      @sidedishes.each_with_index {|answer, i| puts " #{i + 1} #{answer.colorize(:cyan)}"}
      menu
    end

  class Dishes

    def initialize(maindishes, sidedishes, plate)
      @plate = plate
      @sidedishes = sidedishes
      @maindishes = maindishes
      menu2
    end

    def menu2
      puts "What would you like"
      puts "1) A main dish"
      puts "2) A side dish"
      puts "3) Go back"
      option = gets.strip

      case option
      when "1"
        main_dish
      when "2"
        side_dish
      when "3"
        Lunch.new

      else 
        puts "Dude, thats not even an option"
        menu2
      end


    end

    def main_dish
      puts " "
      @maindishes.each_with_index {|answer, i| puts " #{i + 1} #{answer.colorize(:cyan)}"}
      puts "6) Nope go back"
      puts "Anything else"
      main = gets.strip.to_i
      @plate.push(@maindishes[main - 1])
      @plate.each {|food| puts food }
      main_dish
    end
    
    def side_dish
      puts " "
      @maindishes.each_with_index {|answer, i| puts " #{i + 1} #{answer.colorize(:cyan)}"}
      puts "6) Nope go back"
      puts "Anything else"
      main = gets.strip.to_i
      @plate.push(@sidedishes[main - 1])
      @plate.each {|food| puts food }
      side_dish
    end


  end

end

Lunch.new