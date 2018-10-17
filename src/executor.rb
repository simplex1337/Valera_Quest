module ValeraQuest
  class Executor 
    attr_reader :engine 
	
    def initialize
      @engine = Engine.new
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
      puts 'New Game'
    end
	
    def load_game
      self.engine.load_valera_state
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
  end
end
