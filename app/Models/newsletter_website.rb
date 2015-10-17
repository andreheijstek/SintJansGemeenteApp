class NewsletterWebsite

  @@url = "https://zondagsbrief.herokuapp.com/letters/1.json"

  # TODO: Beter opvangen als er geen internet verbinding is
  # TODO: Hardcoded URL vervangen
  # TODO: Exception oid als callback niet gezet is?

  def self.url=(url)
    @@url = url
  end

  def self.callback= (callback)
    @@callback = callback
  end

  def self.getJSON
    @site = @@url

    AFMotion::JSON.get(@site) do |result|
      if result.success?
        @json_text = result.object
        @@callback.call(@json_text)
      elsif result.failure?
        @@callback.call("")
      end
    end
  end

  def self.get_data
    @json_text
  end

end