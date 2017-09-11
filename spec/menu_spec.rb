require 'menu'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

RSpec.describe Menu do
  subject(:menu) { described_class.new }
  let(:order) { double(:order) }

  let(:dishes) do { crispy_duck: 7.50,
            egg_fried_rice: 3.00,
            sweet_and_sour_chicken: 5.60,
            beef_with_black_bean: 5.80,
            crispy_beef: 5.80 }
  end
  it 'contains a list of dishes with prices' do
    expect(subject.dishes).to eq dishes
  end
  it 'prints a list of dishes with prices' do
    expect(subject.print_menu).to eq ({ crispy_duck: 7.50,
          egg_fried_rice: 3.00,
          sweet_and_sour_chicken: 5.60,
          beef_with_black_bean: 5.80,
          crispy_beef: 5.80 })
  end

  it "calculates the cost of an item" do
    expect(menu.cost(:crispy_beef)).to eq(dishes[:crispy_beef])
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some
  # number of several available dishes

  it 'allows the user to order dishes from the menu' do
    expect(menu.place_order('crispy_beef', 1)).to eq 1
  end

  it "calculates the cost of an item" do
    expect(menu.cost(:crispy_beef)).to eq dishes[:crispy_beef]
  end

  it 'gives the price of an order' do
    menu.place_order('crispy_beef', 1)
    expect(subject.order_price).to eq 5.8
  end

end
