class ShiftCell < UITableViewCell
  CellID = 'ShiftCell'

  def self.cellForShift(shift, inTableView:tableView)
    cell = tableView.dequeueReusableCellWithIdentifier(ShiftCell::CellID)
    unless cell
      cell = ShiftCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:ShiftCell::CellID)
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    end
    cell.fillWithShift(shift, inTableView:tableView)
    cell
  end

  def initWithStyle(style, reuseIdentifier:cellid)
    if super
      self.textLabel.numberOfLines = 3
    end
    self
  end

  def fillWithShift(shift, inTableView:tableView)
    self.textLabel.text = StringDate.localDateAndTimeString(shift.date) unless shift.nil?
  end
end
