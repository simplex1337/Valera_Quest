require 'engine'

module ValeraQuest
  class Executor 
    attr_reader :engine, :valera

    def initialize
      @engine = Engine.new
      menu
    end

    def menu
      loop {
        puts '1 - New Game'
        puts '2 - Load Game'
        puts '3 - Exit'
        rez_menu = gets.chomp.to_i

        case rez_menu
          when 1
            system('reset')
            new_game
          when 2
            system('reset')
            load_game
          when 3
            system('reset')
            exit_game
          else
            puts 'Input error!'
        end
      }    
      
    end

    def engine_doom(number)
      if number >= engine.event_list.size then
        raise 'We dont have ascing event'
      end
      self.engine.valeras_doom(number)
    end

    def new_game
      game
    end

    def load_game
      self.engine.load_valera_state
      game
    end

    def save_game
      self.engine.save_valera_state
    end

    def exit_game
        system('reset')
        abort 'Good bye!'
    end

    def game
      puts self.engine.valera.get_full_stat    
      spisok = engine.event_list
      loop {
        if !self.engine.valera.is_dead?
          for i in 0..engine.event_list.size - 1
            puts "#{i}  -  #{spisok[i]}"
          end

          puts 'Select event or Exit - e | Save - s | Check stat Valera - v'
        
          action = gets.chomp

          case action
            when /^[0-9]+/
              engine_doom action.to_i
              system('reset')
              puts self.engine.valera.get_full_stat

            when 's'
              save_game
            
            when 'e'
              exit_game
                
            else
              puts 'Input event error!'  
        
           end
          
          else 
            puts "Valera dead!"
            menu
          end
          
      }

    end

  end

end
