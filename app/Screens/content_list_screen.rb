class ContentListScreen < PM::TableScreen

  title "Zondagsbrief"

  refreshable callback: :on_refresh,
              pull_message: "Pull to refresh",
              refreshing: "Refreshing data"

  def on_init
    NewsletterWebsite.callback = method(:get_content)
  end

  def get_content(data)
    Content.all = data
  end

  def on_refresh
    NewsletterWebsite.getJSON
    end_refreshing
    update_table_data
  end

  def table_data
    [
        {
            cells: Content.all.map do |c|
              {
                  title: c.title.to_s,
                  subtitle: c.notes.to_s,
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