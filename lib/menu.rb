class Menu

  attr_reader :menu

  def initialize
    @menu = { crispy_aromatic_duck: 7.50, salt_and_Pepper_Squid: 5.90, sweet_and_sour_chicken_balls: 5.60, beef_with_black_bean: 5.80, crispy_shredded_beef: 5.80 }
  end

  def print_menu
    puts "Menu"
    @menu.each { |dish, price|
      puts "#{dish} : " + "£%.2f " % "#{price}".ljust(25)
    }
  end

  def restaurant_info
    puts "Welcome to Jim\'s Chinese Takeaway"
    puts ""
    puts "Please select from the following options"
    puts "1. Print menu"
    puts "2. Select dishes"
    puts "3. Exit"
  end

  def interaction(selection)
    case selection
  when "1"
    print_menu
  when "2"
    select_dishes
  when "3"
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

  def select_dishes
    "Puts please input your dish choices"
    answer = STDIN.gets.chomp
    @order = Order.new(answer)
    puts "Your order of #{answer} was succesful."
    puts "Please wait for text confirmation from the restaurant"
  end

end
