/obj/item/organ/tongue/dwarf
	name = "dwarven tongue"
	desc = "A thick, calloused tongue hardened by years of strong ale and hot forge-smoke.
	organ_traits = list(TRAIT_SPEAKS_CLEARLY)
	modifies_speech = TRUE
	liked_foodtypes = ALCOHOL | MEAT | DAIRY | GRAIN
	disliked_foodtypes = RAW | CLOTH | BUGS | GROSS
	toxic_foodtypes = TOXIC
	languages_native = list(/datum/language/dwarven)
	var/static/list/dwarven_speech_replacements = list(
		new /regex(@"\bthe\b", "g") = "tha",
		new /regex(@"\bThe\b", "g") = "Tha",
		new /regex(@"\bTHE\b", "g") = "THA",
		new /regex(@"\byou\b", "g") = "ye",
		new /regex(@"\bYou\b", "g") = "Ye",
		new /regex(@"\bYOU\b", "g") = "YE",
		new /regex(@"\byour\b", "g") = "yer",
		new /regex(@"\bYour\b", "g") = "Yer",
		new /regex(@"\bYOUR\b", "g") = "YER",
		new /regex(@"\byou're\b", "g") = "yer",
		new /regex(@"\bYou're\b", "g") = "Yer",
		new /regex(@"\bYOU'RE\b", "g") = "YER",
		new /regex(@"\bmy\b", "g") = "me",
		new /regex(@"\bMy\b", "g") = "Me",
		new /regex(@"\bMY\b", "g") = "ME",
		new /regex(@"\bto\b", "g") = "tae",
		new /regex(@"\bTo\b", "g") = "Tae",
		new /regex(@"\bTO\b", "g") = "TAE",
		new /regex(@"\bfor\b", "g") = "fer",
		new /regex(@"\bFor\b", "g") = "Fer",
		new /regex(@"\bFOR\b", "g") = "FER",
		new /regex(@"\bno\b", "g") = "nae",
		new /regex(@"\bNo\b", "g") = "Nae",
		new /regex(@"\bNO\b", "g") = "NAE",
		new /regex(@"\bnot\b", "g") = "nae",
		new /regex(@"\bNot\b", "g") = "Nae",
		new /regex(@"\bNOT\b", "g") = "NAE",
		new /regex(@"\blittle\b", "g") = "wee",
		new /regex(@"\bLittle\b", "g") = "Wee",
		new /regex(@"\bLITTLE\b", "g") = "WEE",
		new /regex(@"\byes\b", "g") = "aye",
		new /regex(@"\bYes\b", "g") = "Aye",
		new /regex(@"\bYES\b", "g") = "AYE",
	)

/obj/item/organ/tongue/dwarf/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/speechmod, replacements = dwarven_speech_replacements, should_modify_speech = CALLBACK(src, PROC_REF(should_modify_speech)))

/obj/item/organ/tongue/dwarf/get_possible_languages()
	return ..() + list(/datum/language/dwarven)
