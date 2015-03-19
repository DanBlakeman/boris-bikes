require 'van'
require 'bike'

describe Van do
  it 'can accept a bike' do
    subject.dock double :bike
  end
  it 'can return the bike' do
    bike = double :bike
    subject.dock bike
    expect(subject.release_bike).to eq bike
  end
  it 'raises an error when no bikes are available' do
    subject.dock double :bike
    subject.release_bike
    expect { subject.release_bike }.to raise_error 'van is empty'
  end
end
