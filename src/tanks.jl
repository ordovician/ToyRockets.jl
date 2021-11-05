export SmallTank, MediumTank, LargeTank
export refill!, consume!

mutable struct SmallTank <: Tank
    propellant::Float64
end

mutable struct MediumTank <: Tank
    propellant::Float64
    
end

mutable struct LargeTank <: Tank
    propellant::Float64    
end

propellant(tank::Tank) = tank.propellant
propellant!(tank::Tank, amount::Real) = tank.propellant = amount
 
isempty(tank::Tank) = tank.propellant <= 0
mass(tank::Tank) = drymass(tank) + propellant(tank)

"""
    refill!(tank::Tank)
Fill propellant tankt to the max
"""
function refill!(tank::Tank)
    propellant!(tank, totalmass(tank) - drymass(tank))
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

# These weights are roughly based on the Electron rocket
drymass(::SmallTank) = 40.0
drymass(::MediumTank) = 250.0
drymass(::LargeTank) = 950.0

totalmass(::SmallTank) = 410.0
totalmass(::MediumTank) = 2300.0
totalmass(::LargeTank) = 10200.0


