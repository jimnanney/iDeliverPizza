class ShiftsController < UITableViewController
  def viewDidLoad
    view.dataSource = view.delegate = self
  end

  def viewWillAppear(animated)
      navigationItem.title = "Shifts"
      navigationItem.leftBarButtonItem = editButtonItem
      navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'addShift')
  end

  def addShift

  end

  def tableView(tableView, titleForHeaderInSection:section)
    section == 0 ? "Summary" : "Previous Shifts"
  end

  def numberOfSectionsInTableView(tableView)
    2
  end

  def tableView(tableView, numberOfRowsInSection:section)
    section == 0 ? 1 : DataStore.shared.shifts.size
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    if indexPath.section > 0
      dt = DataStore.shared.shifts[indexPath.row].date
      #cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
      cell = ShiftCell.cellForShift(dt, inTableView:tableView)
    else
      cell = SummaryCell.cellForSummary("Summary", inTableView:tableView)
    end
    #cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
  end

#  def tableView(tableView, editingStyleForRowAtIndexPath:indexPath)
#    UITableViewEditingStyleDelete
#  end

  def tableView(tableView, canEditRowAtIndexPath:indexPath)
    indexPath.section > 0
  end

#  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
#
#  end
#
end