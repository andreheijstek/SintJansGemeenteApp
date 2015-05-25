class ShowContentScreen < PM::Screen
  attr_accessor :content

  def on_load
    self.title = content.title

    @layout = ContentLayout.new(root: self.view)
    @layout.build
    @layout.get(:notes).text = content.notes
  end

  def updateViewConstraints
    @layout.add_top_layout_guide_constraint(self)
    super
  end
end