class Menu

  attr_reader :menu

  def initialize
    @menu = { crispy_aromatic_duck: 7.50, salt_and_Pepper_Squid: 5.90, sweet_and_sour_chicken_balls: 5.60, beef_with_black_bean: 5.80, crispy_shredded_beef: 5.80 }
  end

  def print_menu
    @menu.each { |dish, price|
      puts "#{dish} : " + "£%.2f " % "#{price}".ljust(25)
    }
  end

  def restaurant_info
    puts "Welcome to Jim\'s Chinese Takeaway"
    puts ""
    puts "Please select from the following options"
    puts "1. Print menu"
    puts "2. Exit"
  end

  def interaction(selection)
    case selection
  when "1"
    print_menu
  when "2"
    exit
  else
    puts "Input error, please try again"
    end
  end

  def interactive_menu
    loop do
      restaurant_info
      interaction(STDIN.gets.chomp)
    end
  end

end
