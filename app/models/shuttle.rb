class Shuttle
    attr_reader :model
    attr_accessor :capacity
    @@all = []
    def initialize(model, capacity)
        @model =model
        @capacity = capacity
        @@all << self
    end
    def self.all
        @@all
    end
    def add_astronaut(launch_date, astronaut)
        if self.capacity == 0
            return "Sorry Max capacity reached"
        else
            Mission.new(launch_date, astronaut, self)
            self.capacity -= 1
        end
    end
    def current_astronauts
        self.missions.map {|key| key.astronaut}
    end
    
    def self.find_by_model(model)
        @@all.find {|key| key.model == model}
    end
    def missions
        Mission.all.select{|key| key.shuttle == self}
    end
    def average_age
        total_age = 0
        total_astronaut = 0
        self.missions.select do |key|
            total_age += key.astronaut.age
            total_astronaut += 1
        end
        total_age * 1.0 / total_astronaut * 1.0
    end
    def astronaut_specialities
        self.missions.map {|key| key.astronaut.speciality}
    end
    def self.smallest_mission
        number2 = 999999
        answer = nil
        @@all.select do |value|
        number1 = 0
            Mission.all.select do |key|
                if key.shuttle == value
                    number1 += 1
                end
            end
            if number1 < number2
                answer = value
                number2 = number1
            end
        end
        answer
    end
    def self.most_common_model
        number2 = 0
        answer = nil
        @@all.select do |value|
        number1 = 0
            Mission.all.select do |key|
                if key.shuttle.model == value.model
                    number1 += 1
                end
            end
            if number1 > number2
                answer = value
                number2 = number1
            end
        end
        answer
    end

end
