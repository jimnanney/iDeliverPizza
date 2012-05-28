class TipsMapViewController < UIViewController
  def loadView
    self.view = MKMapView.alloc.init
    view.delegate = self
  end

end