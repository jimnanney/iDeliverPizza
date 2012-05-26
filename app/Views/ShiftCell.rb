class ShiftCell < UITableViewCell
  CellID = 'ShiftCell'

  def self.cellForShift(summary, inTableView:tableView)
    cell = tableView.dequeueReusableCellWithIdentifier(ShiftCell::CellID) || SummaryCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:ShiftCell::CellID)
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.fillWithSummary(summary, inTableView:tableView)
    cell
  end

  def initWithStyle(style, reuseIdentifier:cellid)
    if super
      self.textLabel.numberOfLines = 3
    end
    self
  end

  def fillWithSummary(summary, inTableView:tableView)
    self.textLabel.text = summary
  end
end
