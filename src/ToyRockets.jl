"""
For educational purposes to demonstrate how to create composite types in Julia
and combine them in different ways. Show how to use composition, define interfaces and more.
"""
module ToyRockets

include("interfaces.jl")
include("physics.jl")

include("tank.jl")
include("tanks.jl")
include("flexi-tank.jl")

include("engines.jl")
include("custom-engine.jl")
include("cluster.jl")
include("cluster-index.jl")

include("payloads.jl")
include("empty-rocket.jl")
include("staged-rocket.jl")
include("iterate-rocket.jl")
include("operations.jl")

end
