require 'yaml'
require 'Event.rb'
require 'Valera.rb'

class Engine
    attr_reader :events, :valerra

    def initialize
        puts 'Loading events from config...'
        events_from_file = YAML.load_file '../conf/conf.yml'
        @events Array.new
        events_from_file.each do |line|
            event = Event.new line
            @events.push event
        end

        puts 'Born one more freak Valera...'
        @valerra = Valera.new
    end

    def event_list
        list = Array.new
        self.events.each do |event|
            list.push event.description
        end
        list
    end

    def valeras_doom(number)
        self.events.at(number).apply(@valerra)
    end
end

Engine.new
