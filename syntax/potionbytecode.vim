if exists("b:current_syntax")
    finish
endif

syntax match potionbytecodeKeyword /\v [a-z]+ +\d/he=e-1
syntax match potionbytecodeKeyword /\v [a-z]+ +\d \d/he=e-3

syntax match potionbytecodeIdentifier /\v\.local/
syntax match potionbytecodeIdentifier /\v\.value/
syntax match potionbytecodeIdentifier /\v\.upval/

syntax match potionbytecodeComment /\v;.*$/
syntax match potionbytecodeComment /\v\*\* .*$/

syntax match potionbytecodeNumber /\v<\d+\.?\d*>/

syntax match potionbytecodeSpecial /\v\[ *\d+\]/
syntax match potionbytecodeSpecial /\v[a-z]+ \(/he=e-2

syntax keyword potionbytecodeType nil

syntax region potionbytecodeString start=/\v"/ skip=/\v\\./ end=/\v"/

highlight link potionbytecodeKeyword Keyword
highlight link potionbytecodeIdentifier Identifier
highlight link potionbytecodeComment Comment
highlight link potionbytecodeNumber Number
highlight link potionbytecodeSpecial Special
highlight link potionbytecodeType Type
highlight link potionbytecodeString String

let b:current_syntax = "potionbytecode"
