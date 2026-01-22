#define MAP_PERSISTENT_DIRECTORY "_maps/persistence/" // make sure to update .gitignore if you change this
#define MAP_DIRECTORY_WHITELIST list(MAP_DIRECTORY_MAPS, MAP_DIRECTORY_DATA, MAP_PERSISTENT_DIRECTORY)

#define ZTRAIT_SPACE_EMPTY "Space Empty"

/// Persistent z-levels that have already been loaded into game
#define PERSISTENT_LOADED_Z_LEVELS "persistent_loaded_z_levels"
/// Checks if a persistent map is already loaded
/// We use this to avoid loading maps that have multiple traits enabled (ie. IceBox is considered ZTRAIT_STATION and ZTRAIT_MINING)
#define IS_PERSISTENT_MAP_LOADED(map_file) SSworld_save.map_configs_cache?[PERSISTENT_LOADED_Z_LEVELS][map_file]
