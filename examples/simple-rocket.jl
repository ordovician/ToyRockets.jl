using ToyRockets

payload = Payload(22.8e3)

rocket = Rocket(payload, SmallTank(), Rutherford())

println("Mass of simple rocket: ", mass(rocket))
println("Thrust of simple rocket: ", mass(rocket))