class ShiftsController < UITableViewController
  def viewDidLoad
    view.dataSource = view.delegate = self
  end

  def viewWillAppear(animated)
    navigationController.setToolbarHidden(true, animated:true)
      navigationItem.title = "Shifts"
      navigationItem.leftBarButtonItem = editButtonItem
      navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'addShift')
      reloadData
  end

  def addShift
    @shifts << Shift.new(NSDate.date)
    reloadData
  end

  def tableView(tableView, titleForHeaderInSection:section)
    section == 0 ? "Current Shift" : "Previous Shifts"
  end

  def numberOfSectionsInTableView(tableView)
    2
  end

  def tableView(tableView, numberOfRowsInSection:section)
    section == 0 ? 1 : @shifts.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    if indexPath.section > 0
      cell = ShiftCell.cellForShift(@shifts[indexPath.row], inTableView:tableView)
    else
      cell = SummaryCell.cellForSummary(@currentShift, inTableView:tableView)
    end
  end

  def tableView(tableView, canEditRowAtIndexPath:indexPath)
    indexPath.section > 0
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    if (editingStyle == UITableViewCellEditingStyleDelete)
      @shifts.delete(@shifts[indexPath.row])
      reloadData
    end
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    controller = UIApplication.sharedApplication.delegate.shiftDetailsController
    navigationController.pushViewController(controller, animated:true)

    #controller.showTipsForShift(@shifts[indexPath.row])
  end

  def reloadData
    @shifts = DataStore.shared.shifts
    @currentShift = @shifts[0]
    view.reloadData
  end

end