class Tip
  attr_accessor :amount, :timestamp

  def initialize(amount, timestamp)
    @timestamp = timestamp.nil? ? NSDate.date : timestamp
    @amount = amount
  end

end
