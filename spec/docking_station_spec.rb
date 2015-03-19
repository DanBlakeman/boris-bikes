require 'docking_station'

describe DockingStation do
  it 'releases bikes that are not broken' do
    subject.dock double :bike, broken?: false
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end
  it 'can dock a bike' do
    expect(subject.dock :bike).to eq nil
  end
  it 'raises error when no bikes available' do
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
  it 'raises an error when full' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock double :bike }
    expect { subject.dock double :bike }.to raise_error 'Station Full'
  end
  it 'can have an arbitrary capacity' do
    rand_num = rand(DockingStation::DEFAULT_CAPACITY..9999)
    d_station = DockingStation.new(rand_num)
    expect { rand_num.times { d_station.dock double :bike } }.not_to raise_error
  end
end
