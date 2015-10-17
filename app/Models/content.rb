class Content

  @@all = []

  PROPERTIES = [:title, :notes]
  attr_accessor *PROPERTIES

  def initialize(properties = {})
    properties.each do |key, value|
      if PROPERTIES.member? key.to_sym
        self.send("#{key}=", value.to_s)
        # Note: the to_s was needed, because when clicking on a Content line with the :note as an integer crashed the app
      end
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all=(input)
    input.each do |k, v|
      # @@all << Content.new({title: k, notes: v})
      Content.new({title: k, notes: v})
      # TODO: Use the PROPERTIES here as well - because this is now not automatically scaling when I add properties to Content
    end
  end

  def self.clear_all
    @@all = []
  end

end
