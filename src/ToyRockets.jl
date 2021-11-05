"""
For educational purposes to demonstrate how to create composite types in Julia
and combine them in different ways. Show how to use composition, define interfaces and more.
"""
module ToyRockets

include("interfaces.jl")
include("physics.jl")
include("tanks.jl")
include("engines.jl")
include("rocket.jl")

end
