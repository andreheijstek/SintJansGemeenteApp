describe Content do

  it 'should #initialize' do
    content = Content.new({title: "dummy", notes: "dummy"})
    content.class.should.equal Content
  end

  # Ik moet nu voor ieder element in de data hash een Content instance maken
  # Een content instance verwacht een hash met 2 elementen: title: en notes:
  # data bevat allemaal verschillende keys, zoals id:, time1:, time2: welcome:, etc
  # Dat lijkt me een mooi klusje voor de Content class zelf
  # Dat kan dan eindelijk ook weer eens test-driven
  # Content.set_all(data) => content.all met allemaal losse content instances

  it 'should #set_all with a hash of length 2' do
    Content.set_all({id: 1, something: 'else'})
    Content.all.length.should.equal 2
    Content.all[0]["id"].should.equal 1
    Content.all[1]["something"].should.equal "else"
  end

  it 'should set_all with a hash of length 1 only' do
    Content.set_all({id: 1})
    Content.all.length.should.equal 1
    Content.all.each do |content|
      content.title.should.equal "id"
      content.notes.should.equal 1
    end
  end

end