require 'rails_helper'

describe 'user visits snack show page' do
  before(:each) do
    @owner = Owner.create!(name: 'pearl')
    @snack = Snack.create!(name: 'skittles', price: 1)
    @machine = @snack.machines.create!(location: 'turing', owner: @owner)
  end

  it 'should see name and price of snack' do
    visit snack_path(@snack)

    expect(page).to have_content(@snack.name)
    expect(page).to have_content(@snack.price)
  end
end
