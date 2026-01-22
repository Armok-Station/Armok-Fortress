#define is_space_level(z) (SSmapping.level_trait(z, ZTRAIT_SPACE_RUINS) || SSmapping.level_trait(z, ZTRAIT_SPACE_EMPTY))

#define is_space_empty_level(z) SSmapping.level_trait(z, ZTRAIT_SPACE_EMPTY)

#define is_space_ruins_level(z) SSmapping.level_trait(z, ZTRAIT_SPACE_RUINS)

#define is_ice_ruins_level(z) SSmapping.level_trait(z, ZTRAIT_ICE_RUINS)
