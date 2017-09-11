require 'order'

RSpec.describe Order do
  # subject(:order) { described_class.new(order) }
  let(:order) do {
  crispy_duck: 1 } 
  end
  it 'can add items to an order' do
    subject.add("crispy_duck", 1)
    expect(subject.order).to include "crispy_duck"
  end
  it 'print an order' do
    subject.add("crispy_duck", 1)
    expect(subject.confirm_order).to include "crispy_duck" 
  end

end
