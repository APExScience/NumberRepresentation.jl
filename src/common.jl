# ----------------------------------------------------------------------------------------------- #
#
# Regex special characters set
const regexSpecialChars = Set{Char}(
	[
		'\\', 
		'^',
		'$',
		'.',
		'|',
		'?',
		'*',
		'+',
		'(',
		')',
		'[',
		']',
		'{',
		'}',
		'-'
	]
)

# ----------------------------------------------------------------------------------------------- #
#
# Superscript symbols dictionary: from normal characters to superscript
const superscriptSymbolsDictTo = Dict{Char, Char}(
	'0' => '⁰',
	'1' => '¹',
	'2' => '²',
	'3' => '³',
	'4' => '⁴',
	'5' => '⁵',
	'6' => '⁶',
	'7' => '⁷',
	'8' => '⁸',
	'9' => '⁹',
	'+' => '⁺',
	'-' => '⁻',
	'.' => '·'
)

# ----------------------------------------------------------------------------------------------- #
#
# Superscript symbols dictionary: from superscript to normal characters
const superscriptSymbolsDictFrom = Dict{Char, Char}(v => k for (k, v) ∈ superscriptSymbolsDictTo)



# ----------------------------------------------------------------------------------------------- #
#