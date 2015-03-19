require 'van'
require 'capybara/rspec'

feature 'vans can store bikes' do
  scenario 'vans can accept and give bikes' do
    van = Van.new
    van.dock(Bike.new)
    expect(van.release_bike).to be_a(Bike)
  end
  scenario 'vans can only return the number bikes given to them' do
    van = Van.new
    van.dock Bike.new
    van.release_bike
    expect { van.release_bike }.to raise_error 'van is empty'
  end

  # scenario 'vans can store multiple bikes' do
  #   van = Van.new
  #   2.times { van.dock(Bike.new) }
  #   van.release_bike
  #   expect(van.release_bike).to be_a Bike
  # end
end

# feature 'vans can take broken bikes and return them once fixed' do
#   scenario 'van takes broken bikes from docking station'
#   scenario 'van brings fixed bikes to docking station'
# end
