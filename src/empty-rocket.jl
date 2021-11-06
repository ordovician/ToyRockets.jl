export EmptyRocket, emptyrocket

"An empty without any propellant, mass or thrust. Used to mark the end of a staged rocket"
struct EmptyRocket <: Rocket end
const emptyrocket = EmptyRocket()

mass(::EmptyRocket) = 0.0
thrust(r::EmptyRocket) = 0
update!(r::EmptyRocket, t::Number, Δt::Number) = nothing