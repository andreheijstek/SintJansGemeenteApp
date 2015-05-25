class ContentLayout < MK::Layout
  def layout
    root :content do
      add UILabel, :notes
    end
  end

  def content_style
    background_color UIColor.whiteColor # Or, with MK: "#FFFFFF".uitcolor
  end

  def notes_style
    number_of_lines 0 # making it multi-line
    text_alignment :left.nsalignment # NSTextAlignmentCenter

    constraints do
      left 20
      right -20
    end
  end

  def add_constraints(controller)
    unless @constraint_added
      @constraint_added = true

      constraints(:notes) do
        top.equals(controller.topLayoutGuide, :bottom).plus(20)
      end
    end
  end

=begin
  def mededelingen_style
    background_color UIColor.redColor
  end

  def liturgie_style
    background_color UIColor.blueColor
  end

  def green_view_style
    background_color UIColor.greenColor
  end

  def add_constraints
    unless @layout_constraints_added
      @layout_constraints_added = true

      constraints(:scroll_view) do
        top_left x: 0, y: 0
        bottom_right x: 0, y: 0
      end

      constraints(:content_view) do
        top_left x: 0, y: 0
        bottom_right x: 0, y: 0

        width.equals(:root_view) # .priority(:low)
        height.equals(:root_view).priority(:low)
      end

      constraints(:mededelingen) do
        left 20
        width.is('50%').of(:root_view, :width).minus(30)
        height 500
        top 20
      end

      constraints(:liturgie) do
        left.equals(:mededelingen, :right).plus(20)
        width.is('50%').of(:root_view, :width).minus(30)
        right -20
        height 500
        top 20
      end

      constraints(:green_view) do
        left 20
        right -20
        height 500
        top.equals(:mededelingen, :bottom).plus(20)
        bottom -20
      end
    end
  end
=end

end