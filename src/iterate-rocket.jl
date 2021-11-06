import Base: iterate

Base.IteratorSize(::Rocket) = Base.SizeUnknown()

iterate(r::StagedRocket) = (r, r.nextstage)
iterate(r::Rocket) = (r, nothing)

function iterate(first::StagedRocket, current)
    if current == nothing || current == emptyrocket
        nothing
    else
        current, current.nextstage
    end
end