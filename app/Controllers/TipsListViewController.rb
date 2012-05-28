class TipsListViewController < UITableViewController
  def viewDidLoad
    view.dataSource = view.delegate = self
  end
end