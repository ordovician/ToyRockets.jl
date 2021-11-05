export StagedRocket
export Empty, empty

"An empty without any propellant, mass or thrust. Used to mark the end of a staged rocket"
struct Empty <: Rocket end
const empty = Empty()

"""
A staged rocket is made up of multiple stages which are rockets themselves
"""
struct StagedRocket <: Rocket
    nextstage::Rocket
    tank::Tank
    engine::Engine
end


mass(::Empty) = 0.0


"""
    mass(r::StagedRocket)
Total mass of all stages in a staged rocket
"""
function mass(r::StagedRocket)
    mass(r.nextstage) + mass(r.tank) + mass(r.engine)
end


function update!(r::Empty, t::Number, Δt::Number)
    
end

"""
    update!(r::StagedRocket)
Consume propellant for current active stage (bottom stage and any active boosters).
"""
function update!(r::StagedRocket, t::Number, Δt::Number)
    mflow = mass_flow(thrust(r), ISP(r.engine))
	consume!(r.tank, mflow * Δt)
end

"""
    thrust(r::StagedRocket)
Total thrust of active rocket stage
"""
thrust(r::StagedRocket) = thrust(r.engine)

thrust(r::Empty) = 0
