class Shift
  def initialize(date)
    @date = date
  end

  def date
    @date
  end

  def <=>(other)
    other.nil? ? 1 : date.compare(other.date)
  end
end