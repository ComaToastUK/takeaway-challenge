require 'order'

RSpec.describe Order do
  # subject(:order) { described_class.new(order) }
  let(:order) do {
  crispy_duck: 1 }
  let(:messages) { double(:messages, create: nil) }

  end
  it 'can add items to an order' do
    subject.add("crispy_duck", 1)
    expect(subject.order).to include "crispy_duck"
  end

  it 'prints an order' do
    subject.add("crispy_duck", 1)
    expect(subject.confirm_order).to include "crispy_duck"
  end

  it 'sends a message' do
    expect(client).to_recieve(:messages)
    expect(messages).to_recieve(:create).with()
  end
end
