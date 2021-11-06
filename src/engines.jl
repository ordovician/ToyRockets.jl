import Base: iterate, length
export Engine, Rutherford, Merlin

struct Rutherford <: Engine end
struct Merlin <: Engine end

mass(::Rutherford) = 35
thrust(::Rutherford) = 25000
ISP(::Rutherford) = 311

mass(::Merlin) = 470
thrust(::Merlin) = 845e3
ISP(::Merlin) = 282


function Engine(e::Engine, count::Integer)
    EngineCluster(e, count)
end

function Engine(egn::Engine, es::Engine...)    
    T = typeof(egn)
    Ts = map(typeof, es)
    if all(==(T), Ts)
        EngineCluster(egn, length(es) + 1)
    else
        MixedCluster([egn, es...])
    end
end

struct EngineCluster <: Engine
    engine::Engine
    count::Int
end

struct MixedCluster <: Engine
   engines::Vector{Engine} 
end


function iterate(cluster::EngineCluster)
    cluster.engine, 2
end

function iterate(cluster::EngineCluster, i::Integer)
    if i > cluster.count
        nothing
    else
        cluster.engine, i+1
    end
end

function iterate(cluster::MixedCluster)
    cluster.engines[1], 2
end

function iterate(cluster::MixedCluster, i::Integer)
    if i > length(cluster.engines)
        nothing
    else
        cluster.engines[i], i+1
    end
end

length(cluster::EngineCluster) = cluster.count
length(cluster::MixedCluster) = length(cluster.engines)