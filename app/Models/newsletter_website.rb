class NewsletterWebsite

  attr_reader :json_text
  # attr_accessor :callback
  #
  # def initialize
  #   puts "enter class NewsletterWebsite.initialize"
  #   @site = "https://zondagsbrief.herokuapp.com/letters/1.json"
  #   puts "-- exit class NewsletterWebsite.initialize"
  # end

  def self.callback= (callback)
    @@callback = callback
    puts "exit NewsletterWebsite.callback =, was set to #{callback}"
  end

  def self.getJSON
    puts "enter getJSON"
    @site = "https://zondagsbrief.herokuapp.com/letters/1.json"
    puts "@@callback = #{@@callback}"
    json_text = [Content.new({title: "dummy1", notes: "note1"}), Content.new({title: "dummy2", notes: "note2"})]
    AFMotion::JSON.get(@site) do |result|
      puts "In JSON.get block"
      if result.success?
        puts "  .. JSON.get block | success=TRUE | result = #{result.inspect}"
        json_text = result.object
        @@callback.call(@json_text)
      elsif result.failure?
        puts "  .. JSON.get block | success=FALSE | result = #{result.inspect}"
        p result.error.localizedDescription
        @@callback.call("")
      end
    end
    puts "--exit getJSON"
    json_text
  end

  def self.get_data
    @json_text
  end

end