require 'rails_helper'

describe Machine, type: :model do
  describe 'instance methods' do
    describe '.average_price_of_snacks' do
      owner = Owner.create!(name: 'pearl')
      machine = owner.machines.create!(location: 'turing')
      snack1 = machine.snacks.create!(name: 'skittles', price: 1)
      snack2 = machine.snacks.create!(name: 'sprees', price: 3)

      expect(machine.average_price_of_snacks).to eq(2)
    end
  end
end
