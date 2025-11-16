module NumberRepresentationMakieRichTextExt

using NumberRepresentation
using Makie


import NumberRepresentation: 
	AbstractNumberRepresentation,
	AbstractNumberNotation,
	NumberRepresentationMakieRichText,
	superscriptSymbolsDictFrom,
	@buildNumberRepresentationConstructor



# ----------------------------------------------------------------------------------------------- #
#
NumberRepresentationMakieRichText(repr::NumberRepresentationUnicode{T, U}; timesSymbol::String = "×") where {T, U <:  FixedPointNotation} = begin
	if occursin(repr.representation, repr.timesSymbol)
		str = replace(repr.representation, repr.timesSymbol => timesSymbol)
	else
		str = repr.representation
	end
	str = rich(str)
	return NumberRepresentationMakieRichText{T, U, typeof(str)}(repr.number, str, repr.config, timesSymbol)
end

NumberRepresentationMakieRichText(repr::NumberRepresentationUnicode{T, U}; timesSymbol::String = "×") where {T, U <: Union{ScientificNotation, EngineeringNotation}} = begin
	sig, exp = decomposeNumberFromString(repr.representation, repr.timesSymbol)
	if ! isnothing(exp) && occursin("10", exp)
		exp = replace(exp, "10" => "")
		exp = join(get(superscriptSymbolsDictFrom, c, string(c)) for c ∈ exp) 
		str = rich(sig, timesSymbol, "10", superscript(exp))
	else
		str = rich(sig)
	end

	return NumberRepresentationMakieRichText{T, U, typeof(str)}(repr.number, str, repr.config, timesSymbol)
end

NumberRepresentationMakieRichText(number::Real, ::Type{U}, config::NumberRepresentationConfig; timesSymbol::String = "×") where {U <: AbstractNumberNotation} = begin
	return NumberRepresentationMakieRichText(NumberRepresentationUnicode(number, U, config); timesSymbol = timesSymbol)
end


@buildNumberRepresentationConstructor(NumberRepresentationMakieRichText)


# ----------------------------------------------------------------------------------------------- #
#





end # module

