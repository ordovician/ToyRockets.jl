import Base: isempty

export Tank, propellant, propellant!
export refill!, consume!
export mass

"Stores propellant for a rocket"
abstract type Tank end

"""
    propellant(t::Tank)
Get remaining propellant in tank. Propellant is fuel plus oxidizer
"""
propellant(tank::Tank) = tank.propellant

"""
    propellant!(t::Tank, amount)
Set amount of propellant in tank to `amount`.
"""
propellant!(tank::Tank, amount::Real) = tank.propellant = amount

"""
    isempty(t::Tank)
Check if tank `t` is empty (has no propellant left).
""" 
isempty(tank::Tank) = tank.propellant <= 0

"""
    mass(t::Tank)
The total mass of tank `t`, dry mass plus propellant.
"""
mass(tank::Tank) = drymass(tank) + propellant(tank)

"""
    refill!(tank::Tank) -> Tank
Fill propellant tankt to the max. Returns full tank
"""
function refill!(tank::Tank)
    propellant!(tank, totalmass(tank) - drymass(tank))
    tank
end

"""
    consume!(t::Tank, a::Real)
Comsume `a` amount of propellant in tank `t`.
"""
function consume!(tank::Tank, amount::Real)        
    remaining = max(propellant(tank) - amount, 0)        
    propellant!(tank, remaining)
    remaining
end