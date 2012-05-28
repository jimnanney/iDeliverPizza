class ShiftDetailsController < UIViewController

  def viewWillAppear(animated)
    #@tabView ||= UITabView.alloc.init
    navigationController.setToolbarHidden(false, animated:true)
    #navigationItem.title = "Tips"
    @segmentControl = UISegmentedControl.alloc.initWithItems(["Map", "List"])
    @segmentControl.addTarget(self, action:"viewChange", forControlEvents:UIControlEventValueChanged)
    @segmentControl.bounds = [[0,0], [100,28]]
    @segmentControl.selectedSegmentIndex = 0
    navigationItem.titleView = @segmentControl
    navigationItem.leftItemsSupplementBackButton = true
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'addTip')

#    [segmentedControl addTarget:self
#                         action:@selector(action:)
#               forControlEvents:UIControlEventValueChanged];
#
    toolBarItems = [
#      UIBarButtonItem.alloc.initWithImage(UIImage.imageNamed('List.png'),style:UIBarButtonItemStylePlain, target:self, action:'showList'),
#      UIBarButtonItem.alloc.initWithImage(UIImage.imageNamed('Map.png'),style:UIBarButtonItemStylePlain, target:self, action:'showMap')
      UIBarButtonItem.alloc.initWithTitle("List",style:UIBarButtonItemStylePlain, target:self, action:'showList'),
      UIBarButtonItem.alloc.initWithTitle("Map",style:UIBarButtonItemStylePlain, target:self, action:'showMap')

    ]
    @mapViewController ||= TipsMapViewController.alloc.init
    @listViewController ||= TipsListViewController.alloc.init
    @listViewController.view.frame = @mapViewController.view.frame = view.bounds
    view.insertSubview(@mapViewController.view, atIndex:0)
    setToolbarItems(toolBarItems, animated:true)
    showMap
  end
  def seg
    @segmentControl
  end

  def viewChange
    @segmentControl.selectedSegmentIndex == 1 ? showList : showMap
  end

  def showMap
    swapViews(@mapViewController, @listViewController)
  end

  def showList
    swapViews(@listViewController, @mapViewController)
  end

  def swapViews(coming, going)
    coming.viewWillAppear(true)
    going.viewWillDisappear(true)
    going.view.removeFromSuperview()
    view.insertSubview(coming.view, atIndex:0)
    going.viewDidDisappear(true)
    coming.viewDidAppear(true)
  end

  def showTipsForShift(shift)
  end

  def tipsMapViewController
    @mapViewController
  end

  def tipsListViewController
    @listViewController
  end
end