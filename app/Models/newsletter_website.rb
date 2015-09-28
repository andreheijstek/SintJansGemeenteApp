class NewsletterWebsite

  attr_reader :json_text

  def initialize (&callback)
    @site = "https://zondagsbrief.herokuapp.com/letters/1.json"
    AFMotion::JSON.get(@site) do |result|
      puts "In JSON.get block"
      if result.success?
        @json_text = response.object
        callback.call(@json_text)
      elsif result.failure?
        p result.error.localizedDescription
        callback.call("")
      end
    end
  end

  def self.getJSON
    puts "\nIn getJSON"
    p @json_text
    puts "Leaving getJSON"
  end

end