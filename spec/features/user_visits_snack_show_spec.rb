require 'rails_helper'

describe 'user visits snack show page' do
  before(:each) do
      @owner = Owner.create!(name: 'barry')
      @snack1 = Snack.create!(price: 1, name: 'skittles')
      @machine1 = @snack1.machines.create!(location: 'dons mixed drinks', owner: @owner)
      @snack2 = @machine1.snacks.create!(price: 1, name: 'poprocks')
      @machine2 = @snack1.machines.create!(location: 'turing basement', owner: @owner)
      @snack3 = @machine2.snacks.create!(price: 3, name: 'sprees')
      @snack4 = @machine2.snacks.create!(price: 3, name: 'lik a maid')
      @snack4 = @machine2.snacks.create!(price: 3, name: 'tootsie pop')
  end

  it 'should see name and price of snack' do
    visit snack_path(@snack1)

    expect(page).to have_content(@snack1.name)
    expect(page).to have_content(@snack1.price)
  end

  it 'should see list of locations of machines that carry it' do
    visit snack_path(@snack1)

    within('#locations') do
      expect(page).to have_content(@machine1.location)
      expect(page).to have_content(@machine2.location)
    end
  end

  it 'should see list of the average price of snacks in each machine' do
    visit snack_path(@snack1)

    within('#locations') do
      expect(page).to have_content("Avg Price of Snacks: $#{@machine1.average_price_of_snacks}")
      expect(page).to have_content("Avg Price of Snacks: $#{@machine2.average_price_of_snacks}")
    end
  end
end
