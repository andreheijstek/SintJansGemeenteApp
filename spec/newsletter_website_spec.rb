describe 'NewsletterWebsite' do

  it 'should get JSON data' do
    result = ""
    text = ""
    site = NewsletterWebsite.new do |text|
      # showdata(text)
      result = text
    end

    for i in 1..10 do
      sleep (10)
      text = result
      p text
    end
    result.should.not.equal ""
  end

  def showdata(text)
    puts "\nCallback 'showdata' is called now\n"
    p text
  end
end