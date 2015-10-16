class NewsletterWebsite

  # TODO: Beter opvangen als er geen internet verbinding is
  # TODO: Hardcoded URL vervangen
  # TODO: Exception oid als callback niet gezet is?

  def self.callback= (callback)
    @@callback = callback
  end

  def self.getJSON
    @site = "https://zondagsbrief.herokuapp.com/letters/1.json"
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