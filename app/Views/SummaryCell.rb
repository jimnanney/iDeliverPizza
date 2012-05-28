class SummaryCell < UITableViewCell
  CellID = 'SummaryCell'

  def self.cellForSummary(summary, inTableView:tableView)
    cell = tableView.dequeueReusableCellWithIdentifier(SummaryCell::CellID)
    unless cell
      cell = SummaryCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:SummaryCell::CellID)
    end
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
    self.textLabel.text = summary.nil? ? "None" : StringDate.localDateString(summary.date)
  end
end
