describe Content do

  describe '#all=' do

    after do
      Content.clear_all
    end

    it 'should set #all with a hash of length 0' do
      Content.all = {}
      Content.all.length.should.equal 0
    end

    it 'should set #all with a hash of length 1' do
      Content.all = {id: 1}
      Content.all.length.should.equal 1
      Content.all.each do |content|
        content.title.should.equal "id"
        content.notes.should.equal "1"
      end
    end

    it 'should set #all with a hash of length 2' do
      Content.all = {id: 1, something: 'else'}
      Content.all.length.should.equal 2
      Content.all[0].class.should.equal Content
      Content.all[0].title.should.equal "id"
      Content.all[0].notes.should.equal "1"
      Content.all[1].title.should.equal "something"
      Content.all[1].notes.should.equal "else"
    end
  end

end