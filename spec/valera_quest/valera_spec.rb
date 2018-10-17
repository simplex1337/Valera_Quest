describe ValeraQuest::Valera do
  
  unit = ValeraQuest::Valera.new

  describe 'initialize' do
    context 'constructor for Valera' do
      it 'initialize Valera instance' do
        expect(unit.hp).eql? 100
        expect(unit.mp).eql? 100
        expect(unit.happiness).eql? 10
        expect(unit.cash).eql? 1000
        expect(unit.fatigue).eql? 0
      end
    end
  end
end

 
