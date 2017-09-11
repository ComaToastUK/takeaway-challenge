require_relative 'order'

class Menu

  attr_reader :dishes, :order, :price

  def initialize
    @dishes = { crispy_duck: 7.50,
              egg_fried_rice: 3.00,
              sweet_and_sour_chicken: 5.60,
              beef_with_black_bean: 5.80,
              crispy_beef: 5.80 }
    @order = Order.new
    @price = 0
  end

  def print_menu
    print_menu_header
    @dishes.each { |dish, price|
      puts "#{dish} : " + "£%.2f " % "#{price}".ljust(25)
    }
  end

  def place_order(dish, quantity)
    @order.add(dish, quantity)
  end

  def cost(dish)
    @dishes[dish]
  end

  def order_price
    @order.order.map do |dish, quantity|
      @price += (cost(dish) * quantity)
      order.get_order_price(@price)
    end
  end

private

  def print_menu_header
    puts "Welcome to Jim\'s Chinese Takeaway"
    puts "=================================="
    puts "Our Menu".center(35)
    puts "=================================="
  end

  # def not_found?(dish)
  #   !@dishes[dish].nil?
  # end

  # def restaurant_info
  #   puts "Welcome to Jim\'s Chinese Takeaway"
  #   puts ""
  #   puts "Please select from the following options"
  #   puts "1. Print menu"
  #   puts "2. Select dishes"
  #   puts "3. Exit"
  # end

  # def interaction(selection)
  #   case selection
  # when "1"
  #   print_menu
  # when "2"
  #   select_dishes
  # when "3"
  #   exit
  # else
  #   puts "Input error, please try again"
  #   end
  # end

  # def interactive_menu
  #   loop do
  #     restaurant_info
  #     interaction(STDIN.gets.chomp)
  #   end
  # end

  #
  # def select_dishes
  #   puts "Please input your choice of dishes"
  #   answer = STDIN.gets.chomp
  #   if @menu.include? STDIN
  #     @order = Order.new(answer)
  #     puts "Your order of #{answer} was succesful."
  #     puts "Please wait for text confirmation from the restaurant"
  #   else
  #     puts "Please select an item from the menu and try again"
  #   end
  # end

end
