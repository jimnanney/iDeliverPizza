class DataStore
  def self.shared
    @shared ||=DataStore.new
  end

  def shifts
    @shifts
  end

  def tips
    @tips
  end

  private

  def initialize
    @shifts = [
      Shift.new("1-18-2012"),
      Shift.new("1-17-2012"),
      Shift.new("1-16-2012"),
      Shift.new("1-15-2012"),
      Shift.new("1-14-2012"),
      Shift.new("1-13-2012"),
      Shift.new("1-12-2012"),
      Shift.new("1-11-2012"),
      Shift.new("1-10-2012"),
      Shift.new("1-09-2012"),
      Shift.new("1-08-2012")
      ]
    @tips = Array.new
  end
end