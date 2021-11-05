export Engine, Rutherford, Merlin

struct Rutherford <: Engine end
struct Merlin <: Engine end

mass(::Rutherford) = 35
thrust(::Rutherford) = 25000
ISP(::Rutherford) = 311

mass(::Merlin) = 470
thrust(::Merlin) = 845e3
ISP(::Merlin) = 282