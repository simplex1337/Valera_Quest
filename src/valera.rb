module ValeraQuest
  class Valera
    attr_reader :hp, :mp, :happiness, :cash, :fatigue

    def initialize
      @hp = 100
      @mp = 100
      @happiness = 10
      @cash = 1000
      @fatigue = 0
    end

    def hp=(value)
      @hp = hp + value
      if (self.hp > 100)
        @hp = 100
      end
    end

    def mp=(value)
      @mp = self.mp + value
      if (self.mp < 0)
        @mp = 0
      end
      if (self.mp > 100)
        @hp = self.hp - (self.mp - 100)
        @mp = 100
      end
    end

    def happiness=(value)
      @happiness = self.happiness + value
      if (self.happiness > 10)
        @fatigue = self.fatigue - (self.happiness - 10) * 10
        @happiness = 10
      end
    end

    def cash=(value)
      @cash = self.cash + value
    end

    def fatigue=(value)
      @fatigue = self.fatigue + value
      if (self.fatigue < 0)
        @fatigue = 0
      end
      if (self.fatigue > 100)
        @hp = self.hp - (self.fatigue - 100)
        @fatigue = 100
      end
    end

    def get_full_stat
      Hash["hp" => self.hp, "mp" => self.mp, "happiness" => self.happiness, "cash" => self.cash, 
            "fatigue" => self.fatigue] 
    end

    def is_dead?
      if (self.hp <= 0 || self.happiness <= -10)
        return true
      else
        return false
      end
    end
  end
end
