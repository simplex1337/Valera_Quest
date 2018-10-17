require 'yaml'
require 'Event.rb'
require 'Valera.rb'

class Engine
    attr_reader :events, :valerra

    def initialize
        puts 'Loading events from config...'
        load_events '../conf/conf.yml'
        puts 'Born one more freak Valera...'
        @valerra = Valera.new
    end

    def load_events(file)
        events_from_file = YAML.load_file file
        @events Array.new
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

        self.events.at(number).apply(@valerra)
    end

    def save_valera_state
    end

    def load_valera_state
        valera_state = YAML.load_file '../valera.yml'
    end
end

Engine.new