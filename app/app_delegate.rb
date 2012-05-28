class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    nav = UINavigationController.alloc.initWithRootViewController(ShiftsController.alloc.initWithStyle(UITableViewStyleGrouped))
    nav.wantsFullScreenLayout = true
    nav.toolbarHidden = true
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = nav
    @window.makeKeyAndVisible
    true

#    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
#    tabbar = UITabBarController.alloc.init
#    tabbar.viewControllers = [BeerMapController.alloc.init, BeerListController.alloc.init]
#    tabbar.selectedIndex = 0
#    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tabbar)
#    @window.rootViewController.wantsFullScreenLayout = true
#    @window.makeKeyAndVisible
  end

#  def tipsMapController
#    @tipsMapController ||= tipsMapController.alloc.init
#  end

  def shiftDetailsController
    @shiftDetailsController ||= ShiftDetailsController.alloc.init
  end
end
