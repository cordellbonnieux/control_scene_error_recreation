extends Node
# NOTE NEEDS LOTS OF WORK

var save_path: String = "user://data.cfg"
var config: ConfigFile = ConfigFile.new()
var holy_skulls: int = 0
var maps: Array[Dictionary] = [
	{
		"name": "map1",# TODO; not connected to menu yet
		"unlocked": true
	}
]#TODO figure this out later
var characters: Array[Dictionary] = [
	{
		"name": "Molech",# TODO; not connected to menu yet
		"unlocked": true
	}
] # TODO

# TODO scores to track high scores
# TODO STATS i.e. enemies vanquished, room cleared etc
# TODO UPGRADES i.e. extra loot, speed, armor, etc

func _ready() -> void:
	#_delete()
	_load()
	pass

# TODO
func _save() -> void:
	config.set_value("currencies", "holy skulls", holy_skulls)
	for map in maps: # TODO
		config.set_value("maps", map["name"], map["unlocked"])
	for character in characters:
		config.set_value("characters", character["name"], character["unlocked"])
	config.save(save_path)

# TODO
func _load() -> void:
	var err = config.load(save_path)
	if err != OK:
		return
	holy_skulls = config.get_value("currencies", "holy skulls")
	maps = [
		config.get_value("maps", "map1") # TODO; not connected to menu yet
	]
	characters = [
		config.get_value("characters", "Molech")# TODO; not connected to menu yet
	]

func _delete() -> void:
	holy_skulls = 0
	maps = []
	characters = []
	_save()
