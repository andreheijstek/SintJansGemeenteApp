describe Content do

  it 'should #get_from_website' do
    content = Content.new({title: "dummy", notes: "dummy"})
    text = content.get_from_website
    puts "\nText from website: #{text}"
    text.should.not.equal ""
    text.class.should.equal String
  end
end