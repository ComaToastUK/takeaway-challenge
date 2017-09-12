require "twilio-ruby"
require 'dotenv/load'


class Order

  attr_reader :order, :price, :client, :config

  def initialize
    @order = {}
  end

  def add(dish, quantity)
    @order[dish] = quantity
  end

  def get_order_price(price)
    @price = price
  end

  def confirm_order
    print_order
    text_confirmation
  end

  def print_order
    print_order_header
    print_order_list
    print_order_price
  end

  private

  def print_order_header
    puts "Your Jim\'s Chinese Takeaway Order"
    puts "=================================="
    puts "Your order is as follows;"
  end

  def print_order_list
    @order.each { |dish, quantity|
      puts "#{dish} x #{quantity}"
    }
  end

  def print_order_price
    puts "Your order cost a total of £#{@price}"
    puts "===================================="
  end

  def text_confirmation
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(config=@account_sid, config=@auth_token)
    client.api.messages.create({
      :from => '+441446688202',
      :to =>  '+447969528465',
      :body => 'Your order from Jim\'s will arrive in 1 hour'
      })
  end
end
