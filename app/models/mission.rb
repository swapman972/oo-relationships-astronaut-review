class Mission
    attr_reader :launch_date, :astronaut, :shuttle
    @@all = []
    def initialize(launch_date, astronaut, shuttle)
        @launch_date = launch_date
        @astronaut =astronaut
        @shuttle =shuttle
        @@all << self
    end
    def self.all
        @@all
    end
    def self.first_launch
        array = []
        earliest_date = 3000
        @@all.select do |key|
            if key.launch_date < earliest_date
                earliest_date = key.launch_date
            end
        end
        @@all.select do |key|
            if key.earliest_date == launch_date
                array << key.astronaut
            end
        end
        array
    end
end
