class Event
    attr_accessor :description, :baffs

    def initialize(hash)
        self.description = hash['name']
        hash.delete 'name'
        self.baffs = hash
    end

    def apply(human)
        puts @description
        @baffs.each do |stat, value|
            human.send(stat + '=', value)
        end
    end
end
