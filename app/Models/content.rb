class Content

  @@all = []

  PROPERTIES = [:title, :notes]
  attr_accessor *PROPERTIES

  def initialize(properties = {})
    properties.each do |key, value|
      if PROPERTIES.member? key.to_sym
        self.send("#{key}=", value.to_s) # Note: the to_s was needed, because when clicking on a Content line with the
                                         #       :note as an integer crashed the app
      end
    end
  end


  def self.all
    @@all
  end

  # TODO Ipv set_all, een all= method maken

  def self.all=(input)
    input.each do |k, v|
      @@all << Content.new({title: k, notes: v})
    end
  end

  def self.clear_all
    @@all = []
  end

end
