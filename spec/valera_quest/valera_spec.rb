describe ValeraQuest::Valera do
  
  unit = ValeraQuest::Valera.new

  describe 'initialize' do
    context 'constructor for Valera' do
      it 'initialize Valera instance' do
        expect(unit.hp).to be == 100
        expect(unit.mp).to be == 100
        expect(unit.happiness).to be == 10
        expect(unit.cash).to be == 1000
        expect(unit.fatigue).to be == 0
      end
    end
  end

  describe 'hp=' do
    context 'setter for hp' do
      it 'set hp value' do
        # todo:write smth
      end
    end
  end

  describe 'mp=' do
    context 'setter for mp' do
      it 'set mp value' do
        # todo:write smth
      end
    end
  end

  describe 'happiness=' do
    context 'setter for happiness' do
      it 'set happiness value' do
        # todo:write smth
      end
    end
  end

  describe 'cash=' do
    context 'setter for cash' do
      it 'set cash value' do
        # todo:write smth
      end
    end
  end

  describe 'fatigue=' do
    context 'setter for fatigue' do
      it 'set fatigue value' do
        # todo:write smth
      end
    end
  end

  describe 'get full stat' do
    context 'return stat as hash' do
      it 'return hash' do
        # todo:write smth
      end
    end
  end

  describe 'is_dead?' do
    context 'method returning life condition' do
      it 'return condition' do
        expect(unit.get_full_stat).is_a? Hash
      end
    end
  end


end

 
