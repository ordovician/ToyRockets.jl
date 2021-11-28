import Base: iterate

# Base.IteratorSize(::Rocket) = Base.SizeUnknown()

iterate(r::StagedRocket) = (r, r.nextstage)
iterate(r::Rocket) = nothing

function iterate(first::StagedRocket, current::StagedRocket)
    current, current.nextstage
end

function iterate(first::StagedRocket, current::Rocket)
    nothing
end