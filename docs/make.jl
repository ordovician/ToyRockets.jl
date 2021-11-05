using ToyRockets
using Documenter

DocMeta.setdocmeta!(ToyRockets, :DocTestSetup, :(using ToyRockets); recursive=true)

makedocs(;
    modules=[ToyRockets],
    authors="Erik Engheim <erik.engheim@mac.com> and contributors",
    repo="https://github.com/ordovician/ToyRockets.jl/blob/{commit}{path}#{line}",
    sitename="ToyRockets.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
