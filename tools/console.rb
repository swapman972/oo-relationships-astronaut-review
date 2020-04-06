require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#write your test code in here
jordan = Astronaut.new("jordan", 24, "making sandwich")
ig = Astronaut.new("Ignace", 34, "being a salope")
lance = Astronaut.new("Lance", 20, "drinking rhum")
nicole = Astronaut.new("nicole", 22, "play sims")
flo = Astronaut.new("Florence", 29, "cooking")

shuttle1 = Shuttle.new("AA380", 20)
shuttle2 = Shuttle.new("BO400", 10)
shuttle3 = Shuttle.new("BO250", 5)
shuttle4 = Shuttle.new("BO250", 7)

shuttle1.add_astronaut(2010, jordan)
shuttle1.add_astronaut(2010, ig)
shuttle1.add_astronaut(2010, lance)
shuttle1.add_astronaut(2010, flo)
shuttle2.add_astronaut(2015, nicole)
shuttle2.add_astronaut(2015, jordan)
shuttle2.add_astronaut(2015, lance)

jordan.join_shuttle(2018, shuttle3)
lance.join_shuttle(2018, shuttle3)
ig.join_shuttle(2018, shuttle3)
flo.join_shuttle(2020, shuttle4)
nicole.join_shuttle(2020, shuttle4)


binding.pry

puts "Let's go to space!" # just in case pry is buggy and exits
