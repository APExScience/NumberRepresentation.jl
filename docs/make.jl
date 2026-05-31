using Documenter


push!(LOAD_PATH, joinpath(@__DIR__, "..", "src"))
using NumberRepresentation


DocMeta.setdocmeta!(NumberRepresentation, :DocTestSetup, :(using NumberRepresentation))

makedocs(;
	sitename = "NumberRepresentation.jl",
    authors = "Rafael Alves Batista",
	format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
	modules = [NumberRepresentation],
	pages = [
		"Home" => "index.md",
		"API" => "api.md",
		# "Examples" => "examples.md"
		],
	workdir = joinpath(@__DIR__, ".."),
	doctest = true,
)

deploydocs(;
	repo = "github.com/rafaelab/NumberRepresentation.jl.git", 
	versions = nothing
)