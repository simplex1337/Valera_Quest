require 'yaml'
require 'event.rb'
require 'valera.rb'

module ValeraQuest
  class Engine
    attr_reader :events, :valerra

    def initialize
      load_events '../conf/conf.yml'
      @valerra = Valera.new
    end

    def load_events(file)
      events_from_file = YAML.load_file file
      @events = Array.new
      events_from_file.each do |line|
        event = Event.new line
        @events.push event
      end

    end

    def event_list
      list = Array.new
      self.events.each do |event|
        list.push event.description
      end
      list
    end

    def valeras_doom(number)
      if number >= events.size then
        raise 'We dont have ascing event'
      end
      p self.valerra.get_full_stat
      self.events.at(number).apply(@valerra)
      p self.valerra.get_full_stat
    end

    def save_valera_state(file='./valera.yml')
      states = self.valerra.get_full_stat
      File.open(file, 'w') { |f| f.write states.to_yaml }
    end

    def load_valera_state(file='./valera.yml')
      states = YAML.load_file file
      states.each do |stat, value|
        curr_value = @valerra.send(stat)
        @valerra.send(stat + '=', value - curr_value)
      end
    end
  end
end
