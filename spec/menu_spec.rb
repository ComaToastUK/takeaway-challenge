require 'menu'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

RSpec.describe Menu do
  subject(:menu) { described_class.new }
  it 'prints a list of dishes with prices' do
    expect(subject.menu).to eq ({ crispy_aromatic_duck: 7.50, salt_and_Pepper_Squid: 5.90, sweet_and_sour_chicken_balls: 5.60, beef_with_black_bean: 5.80, crispy_shredded_beef: 5.80 })
  end

  it 'has an interactive_menu' do
    expect(subject.interactive_menu).to include "Welcome to Jim\'s Chinese Takeaway"
  end
end
