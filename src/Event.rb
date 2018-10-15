class Event
    attr_accessor :description, :baffs

    def initialize(description, baffs)
        self.description = description
        self.baffs = baff
    end

    def apply(human)
        puts @description
        @baffs.each do |stat, value|
            human.send(stat + '=', value)
        end
    end
end
