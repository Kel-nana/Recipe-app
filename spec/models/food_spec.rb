require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.new(name: 'mfi',
             measurement_unit: 'kg',
             price: 45)
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'should have a measurement_unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'should have a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end
