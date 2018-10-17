require 'engine'

describe ValeraQuest::Engine do

  unit = ValeraQuest::Engine.new

  describe 'initialize' do
    context 'constructor for Engine' do
      it 'initialize Valera instance' do
        expect(unit.valerra).is_a? ValeraQuest::Valera
      end
      it 'reads events file from conf folder, if it exists' do
        unit.events
      end
    end
  end

  describe 'load_events' do
    context 'loads events from file' do
      unit.load_events 'spec/valera_quest/conf_test.yml'

      it 'returns arrays' do
        expect(unit.events).is_a? Array
      end

      it 'element of array - Hash' do
        expect(unit.events.at(0)).is_a? Hash
      end

      it 'key is Valeras parameter, value is relative value' do
        expect(unit.events.at(0).baffs).to be == {'hp'=>1}
      end

      it 'adds to class Event description' do
        expect(unit.events.at(0).description).to be == "test event"
      end

    end
  end

  describe 'event_list' do
    context 'returns events description' do
      event_list = unit.event_list

      it 'return type - array' do
        expect(event_list).is_a? Array
      end

      it 'element of array is String' do
        expect(event_list[0]).to be == 'test event'
      end

    end
  end

  describe 'valeras_doom' do
    context 'apply event to poor Valera' do
      it 'dooming Valera' do
        unit.valerra.hp = -2 #value is relative
        unit.valeras_doom(0)
        expect(unit.valerra.hp).to be == 99
      end
    end
  end

  describe 'save_valera_state' do
    context 'method to save Valeras state file' do
      it 'saves state to YAML file' do
        unit.save_valera_state
        File.exist? 'valera.yml'
      end
      it 'anyway, you can customize save path' do
        unit.valeras_doom 0
        unit.save_valera_state 'anton.yml'
        File.exist? 'anton.yml'
      end
    end
  end

  describe 'load_valera_state' do
    context 'method to load Valera state' do
      it 'loads state from YAML file' do
        unit.load_valera_state
        expect(unit.valerra.hp).to be == 99
      end
      it 'path to load can be customized to' do
        unit.load_valera_state './anton.yml'
        expect(unit.valerra.hp).to be == 100
      end
    end
  end
end
