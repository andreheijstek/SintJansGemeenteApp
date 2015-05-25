class AppDelegate < PM::Delegate
  def on_load(app, options)
    open ContentListScreen.new(nav_bar: true)
  end
end
