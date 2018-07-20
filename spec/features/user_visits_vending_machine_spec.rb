require 'rails_helper'

describe 'user visits machine show' do
  it 'should see name and price of snacks in machine' do
    owner = Owner.create!(name: 'pearl')
    machine = owner.machines.create!(location: 'turing')
    snack1 = machine.snacks.create!(name: 'skittles', price: 1)
    snack2 = machine.snacks.create!(name: 'sprees', price: 3)

    visit machine_path(machine)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
  end

  it 'should see average price of all snacks' do
    owner = Owner.create!(name: 'pearl')
    machine = owner.machines.create!(location: 'turing')
    snack1 = machine.snacks.create!(name: 'skittles', price: 1)
    snack2 = machine.snacks.create!(name: 'sprees', price: 3)

    visit machine_path(machine)

    expect(page).to have_content("Avg Price of Snacks: #{machine.average_price_of_snacks}")
  end
end
