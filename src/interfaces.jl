export mass
export Tank, propellant, propellant!
export Engine, thrust, ISP, thrust
export Rocket, update!


"A rocket produce thrust by consuming propellant"
abstract type Rocket end

"Stores propellant for a rocket"
abstract type Tank end

"Provides propulsion for a rocket"
abstract type Engine end




"""
    propellant(t::Tank)
Get remaining propellant in tank. Propellant is fuel plus oxidizer
"""
function propellant end

"""
    propellant!(t::Tank, amount)
Set amount of propellant in tank to `amount`.
"""
function propellant! end


"""
    mass(r::Rocket)
    mass(t::Tank)
Mass of given object including its subcomponents.
"""
function mass end

"""
    thrust(r::Rocket)
    thrust(e::Engine)
An engine produces thrust. A rocket will have the same thrust as the sum of the engines
attached to the rocket.
"""
function thrust end


"""
    update!(r::Rocket)
Consume propellant and update mass accordingly
"""
function update! end


"""
    ISP(e::Engine)
Specific Impulse for a rocket engine. Says something about the equivalent of the gas milage
of a rocket. An engine with higher ISP will be able to change the velocity of a rocket more
per unit of fuel, than an engine with lower ISP
"""
function ISP end
