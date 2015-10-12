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
    puts "In ContentListScreen.get_content - data = #{data.inspect}\n"

    # Ik moet nu voor ieder element in de data hash een Content instance maken
    # Een content instance verwacht een hash met 2 elementen: title: en notes:
    # data bevat allemaal verschillende keys, zoals id:, time1:, time2: welcome:, etc
    # Dat lijkt me een mooi klusje voor de Content class zelf
    # Dat kan dan eindelijk ook weer eens test-driven
    # Content.set_all(data) => content.all met allemaal losse content instances

    @content = []
    data.each do |element|
      @content << Content.new(title: element[0], notes: element[1])
    end
  end

  def on_refresh
    # data = NewsletterWebsite.get_data
    NewsletterWebsite.getJSON(@content)
    # @content = data if data != nil
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