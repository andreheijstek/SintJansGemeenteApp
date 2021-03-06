class ContentLayout < MotionKit::Layout
  def layout
    root :content do
      add UILabel, :notes
    end
  end

  def content_style
    background_color UIColor.whiteColor # Or, with MK: "#FFFFFF".uitcolor
  end

  def notes_style
    text "dummy notes text"
    number_of_lines 0 # making it multi-line
    text_alignment :left.nsalignment # NSTextAlignmentCenter

    constraints do
      left 20
      right -20
    end
  end

  def add_constraints
    unless @layout_constraints_added
      @layout_constraints_added = true
    end
  end

end