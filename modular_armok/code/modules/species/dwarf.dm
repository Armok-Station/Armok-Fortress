/datum/species/dwarf
	name = "\improper Dwarf"
	plural_form = "Dwarves"
	id = SPECIES_DWARF
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
		TRAIT_DWARF,
		TRAIT_HEAVY_DRINKER,
		TRAIT_DWARVEN_BEARD,
	)
	skinned_type = /obj/item/stack/sheet/animalhide/carbon/human
	species_language_holder = /datum/language_holder/dwarf
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	payday_modifier = 1.1
	mutanttongue = /obj/item/organ/tongue/dwarf
	mutantliver = /obj/item/organ/liver/dwarf
	mutanteyes = /obj/item/organ/eyes/dwarf
	family_heirlooms = list(
		/obj/item/pickaxe,
		/obj/item/reagent_containers/cup/glass/mug,
	)

/datum/species/dwarf/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_haircolor("#0f0f0b")
	human.set_hairstyle("Braid (Low)")
	human.set_facial_hairstyle("Beard (Dwarf)")
	human.set_facial_haircolor("#251d10")
	human.update_body(is_creating = TRUE)

/datum/species/dwarf/on_species_gain(mob/living/carbon/human/new_dwarf, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()
	if(!ishuman(new_dwarf))
		return

	RegisterSignal(new_dwarf, COMSIG_LIVING_HAIR_UPDATE, PROC_REF(update_beard_status))

/datum/species/dwarf/on_species_loss(mob/living/carbon/human/former_dwarf, datum/species/new_species, pref_load)
	UnregisterSignal(former_dwarf, list(
		COMSIG_LIVING_HAIR_UPDATE,
	))
	return ..()

/datum/mood_event/beard_lost
	description = "I feel naked and ashamed. My ancestors are surely judging my smooth, pathetic chin."
	mood_change = -2

/datum/species/dwarf/proc/update_beard_status(mob/living/carbon/human/dwarf, old_style, new_style)
	SIGNAL_HANDLER

	var/beard_was_removed = (old_style in SSaccessories.facial_hairstyles_dwarf_list) && !(new_style in SSaccessories.facial_hairstyles_dwarf_list)
	var/beard_was_gained = !(old_style in SSaccessories.facial_hairstyles_dwarf_list) && (new_style in SSaccessories.facial_hairstyles_dwarf_list)

	if(beard_was_gained)
		to_chat(dwarf, span_notice("The weight of your ancestors returns to your chin. Your honor is restored."))
		dwarf.clear_mood_event("beard_lost")
	else if(beard_was_removed)
		to_chat(dwarf, span_boldwarning("Disaster! Your beard has been shorn! You feel a deep, ancestral shame."))
		dwarf.add_mood_event("beard_lost", /datum/mood_event/beard_lost)

/datum/species/dwarf/get_physical_attributes()
	return "A short, sturdy creature fond of drink and industry."

/datum/species/dwarf/get_species_description()
	return "They are well known for their stout physique and prominent beards (on the males), \
	which begin to grow from birth; dwarves are stronger, shorter, stockier, and hairier than the average human, \
	have a heightened sense of their surroundings and possess perfect darkvision."

/datum/species/dwarf/get_species_lore()
	return list(
		"Dwarven civilizations typically form (mostly) peaceful, trade-based relationships with humans and elves, \
		but are bitter enemies with goblins, and consider kobolds a petty annoyance. Dwarven babies become children \
		one year after birth, grow up to become adults at their eighteenth birthday, and live to be around 150-170 years of age.",

		"Dwarves live both in elaborate underground fortresses carved from the mountainside and above-ground hillocks, \
		are naturally gifted miners, metalsmiths, and stone crafters, and value the acquisition of wealth and rare \
		metals above all else.",
	)

/datum/species/dwarf/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_EYE,
			SPECIES_PERK_NAME = "Cave Adaptation",
			SPECIES_PERK_DESC = "Dwarves have minor night vision, adapted from generations \
				of living in deep underground fortresses.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = FA_ICON_MOON,
			SPECIES_PERK_NAME = "Masterwork Beard",
			SPECIES_PERK_DESC = "Dwarves beards are their pride, joy, and history. \
				To be clean-shaven is to be a dwarf without a past, leading to profound melancholy.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_BEER,
			SPECIES_PERK_NAME = "Alcoholic",
			SPECIES_PERK_DESC = "A dwarf needs alcohol to get through the working day. \
				They become drunk more slowly and suffer fewer drawbacks from alcohol.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = FA_ICON_HORSE,
			SPECIES_PERK_NAME = "Mount Restrictions",
			SPECIES_PERK_DESC = "Due to their short legs, dwarves are unable to properly ride animals with mounts.",
		),
	)

	return to_add

// =======================
// =   L A N G U A G E   =
// =======================

/datum/language/dwarven
	name = "Dwarven"
	desc = "The common language of dwarven civilization. It is said that the true names of all minerals were first spoken in this language."
	key = "d"
	icon = 'modular_armok/icons/ui/chat/df_language.dmi'
	icon_state = "dwarf"
	flags = TONGUELESS_SPEECH|LANGUAGE_HIDE_ICON_IF_NATIVE_SPEAKER
	default_priority = 90
	// TODO: Add mutual understanding with elf/human languages
	// mutual_understanding = list(
	// 	/datum/language/elven = 20,
	// 	/datum/language/human = 30,
	// )
	syllables = list(
		list(
			"za", "az", "ze", "ez", "zi", "iz", "zo", "oz", "zu", "uz", "zs", "sz",
			"ha", "ah", "he", "eh", "hi", "ih", "ho", "oh", "hu", "uh", "hs", "sh",
			"la", "al", "le", "el", "li", "il", "lo", "ol", "lu", "ul", "ls", "sl",
			"ka", "ak", "ke", "ek", "ki", "ik", "ko", "ok", "ku", "uk", "ks", "sk",
			"sa", "as", "se", "es", "si", "is", "so", "os", "su", "us", "ss", "ss",
			"ra", "ar", "re", "er", "ri", "ir", "ro", "or", "ru", "ur", "rs", "sr",
			"mò", "är", "ön", "gò", "êk", "äg", "sá", "ât", "nô", "ôr", "dù", "ùs",
			"lå", "åt", "hî", "îk", "ím", "ín", "lì", "mà", "às", "äk", "kâ", "àm",
			"åb", "tï", "ïg", "ní", "ít", "cö", "ös", "gî", "îk", "tí", "íl", "dë",
			"a",  "ä",  "e",  "ê",  "i",  "î",  "ö",  "o",  "ù",  "u",  "s",  "ën"
		),
		list(
			"ur", "ist", "kad", "ol", "dum", "âth", "tun", "mor",
			"rak", "eth", "gor", "bok", "lun", "zan", "mol", "tar",
			"sod", "kol", "ber", "dor", "lor", "bam", "nil", "rith",
			"gat", "dak", "sol", "rum", "lok", "zùd", "stin", "ost",
		),
		list(
			"khaz", "grun", "thöl", "drak", "stìg", "krul", "brom", "grìm",
			"skul", "zrak", "drum", "brun", "thrum", "grol", "krag", "sturn",
			"ngol", "mek", "tog", "san", "lim", "ösk", "ang", "asm",
		),
		list(
			"ådil", "akmes", "arban", "atast", "egäth", "êzum", "inod",
			"olìn", "olom", "onòl", "ubbul", "udil", "udist", "ugath",
			"uldar", "ulzon", "umrìl", "urdim", "uzòl", "zulban",
		),
	)

GLOBAL_LIST_INIT(dwarf_first_names, world.file2list("strings/names/dwarf_first.txt"))
GLOBAL_LIST_INIT(dwarf_surname_words, world.file2list("strings/names/dwarf_surname.txt"))

/datum/language/dwarven/get_random_name(
	gender = NEUTER,
	name_count = default_name_count,
	syllable_min = default_name_syllable_min,
	syllable_max = default_name_syllable_max,
	force_use_syllables = FALSE,
)
	if(force_use_syllables || !length(GLOB.dwarf_first_names) || !length(GLOB.dwarf_surname_words))
		return ..()

	// First name: single noun from the dwarven language (e.g. "Urist", "Kadol")
	var/first_name = capitalize(pick(GLOB.dwarf_first_names))

	// Surname: compound of two dwarven words (e.g. "Kogankogsak" -> Boatstockade in game)
	var/surname = capitalize("[pick(GLOB.dwarf_surname_words)][pick(GLOB.dwarf_surname_words)]")

	return "[first_name] [surname]"

/datum/language_holder/dwarf
	understood_languages = list(
		/datum/language/dwarven = list(LANGUAGE_ATOM),
	)
	spoken_languages = list(
		/datum/language/dwarven = list(LANGUAGE_ATOM),
	)

// ===================
// =   O R G A N S   =
// ===================

/obj/item/organ/tongue/dwarf
	name = "dwarven tongue"
	desc = "A thick, calloused tongue hardened by years of strong ale and hot forge-smoke."
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

/obj/item/organ/eyes/dwarf
	name = "dwarven eyes"
	desc = "A pair of eyes adapted to the perpetual darkness of underground fortresses. \
		They grant minor vision in dim conditions."
	organ_traits = list(TRAIT_MINOR_NIGHT_VISION)

/obj/item/organ/liver/dwarf
	name = "dwarven liver"
	desc = "An incredibly robust liver, hardened by generations of legendary drinking. \
		It processes alcohol with remarkable efficiency."
	organ_traits = list(TRAIT_ALCOHOL_TOLERANCE)
