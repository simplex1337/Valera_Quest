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
	
	def new_game
		puts 'New Game'
		engine.initialize
	end
	
	def load_game
		engine.load_valera_state
	end
	
	def exit_game
		puts 'Save Game?'
		puts '1 - Yes | 2 - No'
		exit_rez = gets.chomp.to_i
				
		case exit_rez
			when 1
				engine.save_valera_state
				
			when 2
				exit 'Good bay!'
				
			else
				puts 'Input error!'
		end
			
	end

end
