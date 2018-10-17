module ValeraQuest
  class Executor 
    attr_reader :engine, :valera
	
    def initialize
      @engine = Engine.new
    end
	
    def menu
      puts '1 - New Game'
      puts '2 - Load Game'
      puts '3 - Save Game'
      puts '4 - Exit'
      rez_menu = gets.chomp.to_i
		
      case rez_menu
        when 1
          new_game
        when 2
          load_game
        when 3
		  save_game
        when 4
          exit_game
        else
          puts 'Input error!'
      end
    end
	
    def event_list
      list = Array.new
      self.event.each do |event|
        list.push event.description
      end
      list
    end
	
    def engine_doom(number)
      if number >= event.size then
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
      puts 'Save Game?'
      puts '1 - Yes | 2 - No'
      exit_rez = gets.chomp.to_i
				
      case exit_rez
        when 1 
          self.engine.save_valera_state
        when 2
          exit 'Good bay!'
        else
          puts 'Input error!'
      end
    end
    
    def game
      puts self.valera.get_full_stat
      puts 'Select event:'
      puts '0 - ' event_list.list(0)
      puts '1 - ' event_list.list(1)
      puts '2 - ' event_list.list(2)
      puts '3 - ' event_list.list(3)
      puts '4 - ' event_list.list(4)
      puts '5 - ' event_list.list(5)
      event = gets.chomp.to_i      
      
      case 
        when 0..5
          engine_doom event
        else
          puts 'Input error event!'
      end
    end
  end
end
