class MainViewController < UIViewController
  def loadView
    @layout = MainLayout.new
    self.view = @layout.view
    view.setNeedsUpdateConstraints
  end

  def updateViewConstraints
    @layout.add_constraints
    super
  end
end