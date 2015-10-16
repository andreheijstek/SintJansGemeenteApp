class ShowContentScreen < PM::Screen

  attr_accessor :content
  # This creates an instance variable @content and creates a setter and getter for it.
  # There is a default initialize method (inherited from PM::Screen) that sets this value
  #   you can see it is called from ContentListScreen.showContent, which passes a Hash {content: content}
  #   to the initializer.
  # So, @content is set to {content: content}
  # What I don't understand is that the local (?) variable content is also set, to exactly the same
  # value as @content
  # There might be some ProMotion magic involved in here.

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