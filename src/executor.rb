require 'engine'

module ValeraQuest
  class Executor 
    attr_reader :engine, :valera

    def initialize
      @engine = Engine.new
      @valera = Valera.new
      menu
    end

    def menu
      puts '1 - New Game'
      puts '2 - Load Game'
      puts '3 - Exit'
      rez_menu = gets.chomp.to_i

      case rez_menu
      when 1
        new_game
      when 2
        load_game
      when 3
        exit_game
      else
        puts 'Input error!'
      end
    end

    def engine_doom(number)
      if number >= engine.event_list.size then
        raise 'We dont have ascing event'
      end
      engine.valeras_doom(number)
    end

    def new_game
      game
    end

    def load_game
      self.engine.load_valera_state
      game
    end

    def save_game
      self.save_valera_state
    end

    def exit_game
        abort 'Good bye!'
    end

    def game
      puts valera.get_full_stat    
      spisok = engine.event_list
      loop {
        for i in 0..engine.event_list.size - 1
          puts "#{i}  -  #{spisok[i]}"
        end

        puts 'Select event or Exit - e | Save - s | Check stat Valera - v'
        
        action = gets.chomp

        case action
          when /^[0-9]+/
            engine_doom action.to_i

          when 's'
            save_game
            
          when 'e'
            exit_game
            
          when 'v'
			puts valera.get_full_stat
            
          else
            puts 'Input event error!'  
        
        end

      }

    end

  end

end
