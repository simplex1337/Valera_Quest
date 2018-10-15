class Valera
    attr_accessor :hp, :mp, :happiness, :cash, :fatigue

    def initialize
        @hp = 100
        @mp = 100
        @happiness = 10
        @cash = 1000
        @fatigue = 0
    end

    def mp=(value)
        @mp = self.mp + value
        if (mp < 0)
            @mp = 0
        end
        if (mp > 100)
            @hp = self.hp - (100 - self.mp)
            @mp = 100
        end
    end

    def get_full_stat
        
    end

    def isdead?
        if (self.hp <= 0 || self.happiness <= -10)
            return true
        else
            return false
        end
    end