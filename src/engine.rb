require 'yaml'
require 'event'
require 'valera'

module ValeraQuest
  class Engine
    attr_reader :events, :valera

    def initialize(path='../conf/conf.yml')
      @events = nil
      @valera = Valera.new
      if File.exist? path then
        load_events path
      end
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
      self.events.at(number).apply(@valera)
    end

    def save_valera_state(file='./valera.yml')
      states = self.valera.get_full_stat
      File.open(file, 'w') { |f| f.write states.to_yaml }
    end

    def load_valera_state(file='./valera.yml')
      @valera = Valera.new
      states = YAML.load_file file
      states.each do |stat, value|
        curr_value = @valera.send(stat)
        @valera.send(stat + '=', value - curr_value)
      end
    end
  end
end
