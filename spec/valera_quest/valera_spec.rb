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
        unit.hp = -1
        expect(unit.hp).to be == 99
        unit.hp = 10
        expect(unit.hp).to be == 100
      end
    end
  end

  describe 'mp=' do
    context 'setter for mp' do
      it 'set mp value' do
        unit.mp = -1
        expect(unit.mp).to be == 99
        unit.mp = 11
        expect(unit.mp).to be == 100
        expect(unit.hp).to be == 90
        unit.mp = -1000
        expect(unit.mp).to be == 0
        #reset hp to 100
        unit.hp = 10
      end
    end
  end

  describe 'happiness=' do
    context 'setter for happiness' do
      it 'set happiness value' do
        unit.happiness = -11
        expect(unit.happiness).to be == -1
        unit.happiness = 13
        unit.fatigue = 30
        expect(unit.happiness).to be == 10
        expect(unit.fatigue).to be == 10
        #reset fatigue to 0
        unit.fatigue = -10
      end
    end
  end

  describe 'cash=' do
    context 'setter for cash' do
      it 'set cash value' do
        unit.cash = 100
        expect(unit.cash).to be == 1100
        unit.cash = -200
        expect(unit.cash).to be == 900
      end
    end
  end

  describe 'fatigue=' do
    context 'setter for fatigue' do
      it 'set fatigue value' do
        unit.fatigue = 10
        expect(unit.fatigue).to be == 10
        unit.fatigue =91
        expect(unit.fatigue).to be == 100
        expect(unit.hp).to be == 99
        unit.fatigue = -1000
        expect(unit.fatigue).to be == 0
        #reset hp to 100
        unit.hp = 1
      end
    end
  end

  describe 'get full stat' do
    context 'return stat as hash' do
      it 'return hash' do
        expect(unit.get_full_stat).is_a? Hash        
      end
    end
  end

  describe 'is_dead?' do
    context 'method returning life condition' do
      it 'return condition' do
        unit.hp = -1000
        expect(unit.is_dead?).to be == true
        unit.hp = 1000
        expect(unit.is_dead?).to be == false
        unit.happiness = -20
        expect(unit.is_dead?).to be == true
        unit.happiness = 20
        expect(unit.is_dead?).to be == false
      end
    end
  end
end

 
