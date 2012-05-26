class SummaryCell < UITableViewCell
  CellID = 'SummaryCell'

  def self.cellForSummary(summary, inTableView:tableView)
    cell = tableView.dequeueReusableCellWithIdentifier(SummaryCell::CellID) || SummaryCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:SummaryCell::CellID)
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
