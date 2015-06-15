class Content

  def self.all
    [
    Content.new({tile: "Welkom", notes: "Beste gemeenteleden en gasten,\nHartelijk welkom in deze dienst. Laten we met elkaar bidden om Gods zegen over de diensten van deze zondag"}),
    Content.new({tile: "Erediensten", notes: "10:00 | St. Janskerk | Vreugdenhil | info\n17:00 | St. Janskerk | Batenburg | info"}),
    Content.new({tile: "Collectes", notes: "Eerste collecte: financiële hulp aan gemeenteleden, (Burennetwerk Gouda).\nTweede collecte: Kerkbeheer\n\nDenkt u ook aan de zendingsbussen bij de uitgang?"}),
    Content.new({tile: "Gebedsrubriek", notes: "Via de wijkkerkenraden wordt voorbede en dankzegging door de gemeente gevraagd voor: Koen en Petra den Hartogh. Koen is druk bezig met voorbereidingen voor een alfabetiserings app. Hiervoor hopen ze de overheid te interesseren en ze willen hen vragen om dit initiatief te ondersteunen. Bid dat dit mag slagen en dat het bij zal dragen aan beter onderwijs in PNG.\nDankpunten: met Thijs en Chris gaat het goed. Het zijn vrolijke jongens en ze blaken van gezondheid."}),
    Content.new({tile: "Oproep en mededelingen", notes: "Cantatedienst in de St. Janskerk. Zaterdag 23 mei zal er om 16.00 uur een cantatedienst in de St. Janskerk gehouden worden met de Bachcantate ‘Gottes Zeit is die allerbeste Zeit’ (BWV 106). Meditatie: ds. M.C. Batenburg. Met medewerking van het studentenkoor van Driestar Hogeschool.\nStartZaterZondag 2015. Op 12 en 13 september hopen we als St. Jansgemeente het nieuwe seizoen met elkaar te openen. Graag stellen we u/jou nu al op de hoogte. Het zaterdagprogramma begint om 16.00 uur. Verdere informatie volgt spoedig. Noteer alvast deze data in uw/jouw agenda."})
    ]
  end

  PROPERTIES = [:title, :notes]
  attr_accessor *PROPERTIES

  def initialize(properties = {})
    properties.each do |key, value|
      if PROPERTIES.member? key.to_sym
        self.send("#{key}=", value)
      end
    end
  end

  def get_from_website
    AFMotion::HTTP.get("http://www.improvementfocus.com/pages/zondagsbrief.php") do |result|
      p result.body
    end
    output = ""
    AFMotion::HTTP.get("http://www.google.com") do |response|
      puts "Inside do block 1"
      p response
      p response.body
      output = response.body.to_str.dup
    end
    output
  end
end