class ContentListScreen < PM::TableScreen
  title "Zondagsbrief"

  refreshable callback: :on_refresh,
              pull_message: "Pull to refresh",
              refreshing: "Refreshing data"

  def on_init
    puts "enter ContentListScreen.on_init"
    # @site = NewsletterWebsite.new
    # Call can be removed, as I will work only with Class methods, so I don't need an instance
    # puts "in ContentListScreen.on_init. @site = #{@site}"
    # @site.callback = get_content
    NewsletterWebsite.callback = method(:get_content)
    @content = [Content.new({title: "dummy", notes: "not"})]
    puts "exit ContentListScreen.on_init"
  end

  def get_content(data)
    puts "enter ContentListScreen.get_content"
    # @site.getJSON
    # @content = @site.json_text
    puts "In ContentListScreen - @content = #{data.inspect}\n"
  end

  # TODO: add a refresh option to the table, hopefully the JSON will be picked up later

  def on_refresh
    data = NewsletterWebsite.get_data
    NewsletterWebsite.getJSON
    @content = data if data != nil
    puts "in ContentListScreen.on_refresh - @content = #{@content}"
    end_refreshing
    update_table_data
  end

  def table_data
    [
        {
            cells: @content.map do |c|
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