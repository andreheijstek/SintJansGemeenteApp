class ShowContentScreen < PM::Screen

  attr_accessor :content

  def on_load
    self.title = @content.title

    @layout = ContentLayout.new(root: self.view)
    @layout.build
    @layout.get(:notes).text = @content.notes
  end

  def updateViewConstraints
    @layout.add_constraints #(self)
    super
  end
end