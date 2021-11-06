export Rutherford, Merlin

struct Rutherford <: Engine end
struct Merlin <: Engine end

mass(::Rutherford) = 35
thrust(::Rutherford) = 25000
Isp(::Rutherford) = 311

mass(::Merlin) = 470
thrust(::Merlin) = 845e3
Isp(::Merlin) = 282
