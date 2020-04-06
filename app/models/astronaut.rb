class Astronaut
    attr_accessor :age, :speciality
    attr_reader :name
    @@all = []
    def initialize(name, age, speciality)
        @name =name
        @age =age
        @speciality =speciality
        @@all << self
    end
    def self.all
        @@all
    end
    def shuttles
        array = []
        Mission.all.select do |key|
            if key.astronaut == self
                array << key.shuttle
            end
        end
        array
    end
    def join_shuttle(launch_date, shuttlee)
        if shuttlee.capacity == 0
            p "This shuttle is at capacity!"
        else
            Mission.new(launch_date, self, shuttlee)
            shuttlee.capacity -= 1
        end
    end
    def self.most_missions
        number2 = 0
        answer = nil
        @@all.select do |value|
        number1 = 0
            Mission.all.select do |key|
                if key.astronaut == value
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
