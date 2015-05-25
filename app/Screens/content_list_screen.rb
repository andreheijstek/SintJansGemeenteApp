class ContentListScreen < PM::TableScreen
  title "Zondagsbrief"

  def table_data
    [
        {
            cells: Content.all.map do |c|
              {
                  title: c.title,
                  subtitle: c.notes,
                  cell_style: UITableViewCellStyleSubtitle, # TODO Experiment with different styles
                  action: :show_content,
                  arguments: c
              }
            end
        }
    ]
  end

  def show_content(content)
    open ShowContentScreen.new({ content: content })
  end

end