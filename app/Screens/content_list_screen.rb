class ContentListScreen < PM::TableScreen
  title "Zondagsbrief"

  refreshable callback: :on_refresh,
              pull_message: "Pull to refresh",
              refreshing: "Refreshing data"

  def on_init
    # puts "enter ContentListScreen.on_init"
    # @site = NewsletterWebsite.new
    # Call can be removed, as I will work only with Class methods, so I don't need an instance
    # puts "in ContentListScreen.on_init. @site = #{@site}"
    # @site.callback = get_content
    NewsletterWebsite.callback = method(:get_content)
    @content = [Content.new({title: "dummy", notes: "not"})]
    # puts "exit ContentListScreen.on_init"
  end

  def get_content(data)
    Content.set_all(data)
    # puts "Content.all = #{Content.all}"
    Content.all.map do |c|
      puts "title = #{c.title}, notes = #{c.notes}"
    end
  end

  def on_refresh
    # data = NewsletterWebsite.get_data
    NewsletterWebsite.getJSON(@content)
    # @content = data if data != nil
    # puts "in ContentListScreen.on_refresh - @content = #{@content}"
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