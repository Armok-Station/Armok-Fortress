/datum/sprite_accessory
	/// Determines if the accessory should be put in a seperate list for species
	/// Used to restrict dwarves to long beards, elves to be beardless, etc.
	var/species

// This is used to create a list of facial hair preferences on character creation
// that dwarves are restricted too (forcing them to pick a large beard)
/datum/sprite_accessory/facial_hair/vlongbeard
	species = SPECIES_DWARF

/datum/sprite_accessory/facial_hair/martialartist
	species = SPECIES_DWARF

/datum/sprite_accessory/facial_hair/moonshiner
	species = SPECIES_DWARF

/datum/sprite_accessory/facial_hair/longbeard
	species = SPECIES_DWARF

/datum/sprite_accessory/facial_hair/brokenman
	species = SPECIES_DWARF

/datum/sprite_accessory/facial_hair/dwarf
	species = SPECIES_DWARF
