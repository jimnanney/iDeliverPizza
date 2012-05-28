class StringDate
  def self.dateFormatter
      @@dateFormatter ||= NSDateFormatter.alloc.init
  end

  def self.localDateString(date)
    self.dateFormatter.setDateStyle(NSDateFormatterMediumStyle)
    self.dateFormatter.setTimeStyle(NSDateFormatterNoStyle)
    return dateFormatter.stringFromDate(date)
  end

  def self.localTimeString(date)
    self.dateFormatter.setTimeStyle(NSDateFormatterShortStyle)
    self.dateFormatter.setDateStyle(NSDateFormatterNoStyle)
    return dateFormatter.stringFromDate(date)
  end

  def self.localDateAndTimeString(date)
    self.dateFormatter.setTimeStyle(NSDateFormatterShortStyle)
    self.dateFormatter.setDateStyle(NSDateFormatterShortStyle)
    return dateFormatter.stringFromDate(date)
  end
end
