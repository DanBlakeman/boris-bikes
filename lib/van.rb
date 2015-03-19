class Van
  def initialize
    @bikes = []
  end

  def dock(bike)
    @bikes << bike
  end

  def release_bike
    fail 'van is empty' if @bikes.empty?
    @bikes.pop
  end
end
