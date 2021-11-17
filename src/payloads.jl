export Payload

struct Payload <: Rocket 
    mass::Float64
end

mass(payload::Payload) = payload.mass
thrust(r::EmptyPayload) = 0
update!(r::EmptyPayload, t::Number, Δt::Number) = nothing