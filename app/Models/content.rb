class Content

  @@all = []
  
  def self.all
    # TODO: Vervangen door een echte #all
    # Dus niet meer hierin contents initialiseren, maar alle contents ophalen
    # Daarvoor zal er wel een class variabele @@all gemaakt moeten worden, of zo iets

    # [
    # Content.new({title: "Welkom", notes: "Beste gemeenteleden en gasten,\nHartelijk welkom in deze dienst. Laten we met elkaar bidden om Gods zegen over de diensten van deze zondag"}),
    # Content.new({title: "Erediensten", notes: "10:00 | St. Janskerk | Vreugdenhil | info\n17:00 | St. Janskerk | Batenburg | info"}),
    # Content.new({title: "Collectes", notes: "Eerste collecte: financiële hulp aan gemeenteleden, (Burennetwerk Gouda).\nTweede collecte: Kerkbeheer\n\nDenkt u ook aan de zendingsbussen bij de uitgang?"}),
    # Content.new({title: "Gebedsrubriek", notes: "Via de wijkkerkenraden wordt voorbede en dankzegging door de gemeente gevraagd voor: Koen en Petra den Hartogh. Koen is druk bezig met voorbereidingen voor een alfabetiserings app. Hiervoor hopen ze de overheid te interesseren en ze willen hen vragen om dit initiatief te ondersteunen. Bid dat dit mag slagen en dat het bij zal dragen aan beter onderwijs in PNG.\nDankpunten: met Thijs en Chris gaat het goed. Het zijn vrolijke jongens en ze blaken van gezondheid."}),
    # Content.new({title: "Oproep en mededelingen", notes: "Cantatedienst in de St. Janskerk. Zaterdag 23 mei zal er om 16.00 uur een cantatedienst in de St. Janskerk gehouden worden met de Bachcantate ‘Gottes Zeit is die allerbeste Zeit’ (BWV 106). Meditatie: ds. M.C. Batenburg. Met medewerking van het studentenkoor van Driestar Hogeschool.\nStartZaterZondag 2015. Op 12 en 13 september hopen we als St. Jansgemeente het nieuwe seizoen met elkaar te openen. Graag stellen we u/jou nu al op de hoogte. Het zaterdagprogramma begint om 16.00 uur. Verdere informatie volgt spoedig. Noteer alvast deze data in uw/jouw agenda."})
    # ]
    @@all
  end

  PROPERTIES = [:title, :notes]
  attr_accessor *PROPERTIES

  def initialize(properties = {})
    properties.each do |key, value|
      if PROPERTIES.member? key.to_sym
        self.send("#{key}=", value)
      end
    end

    # website = NewsletterWebsite.initialize(get_from_website(response))

  end

  # def get_from_website(response)
  #   puts "Data received from the JSON: #{response}"
  # end

  def self.set_all(input)
    input.each do |k, v|
      @@all << Content.new({title: k, notes: v})
    end
  end

  def self.clear_all
    @@all = []
  end

=begin

JSON provides key/value pairs with as keys:
- id
- welcome
- date
- time1
- time2
- announcements
- liturgy
- created_at
- updated_at

I could use this to create Content-instances, with key as :title and value as :note
That would then be displayed.
To do that, self.all should be deleted
A new #all should parse the JSON into new Content-instances.
The strange thing is that Content creates itself.
That could be done using #get_from_website as Class method and #all as Class method as well.
Instance methods could be added when needed

=end

end
