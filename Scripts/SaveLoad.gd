extends Node
class_name SaveLoader

func _ready() -> void:
	#print(GlobalData.lore_states)
	Load()
	#print(GlobalData.lore_states)

func Save():
	var saved_game:SavedGame = SavedGame.new()
	save_lore_status()
	
	saved_game.madness = GlobalData.madness
	saved_game.madness_max = GlobalData.madness_max
	saved_game.spirituality = GlobalData.spirituality
	saved_game.lore_states = GlobalData.lore_states
	saved_game.passion = GlobalData.passion
	
	ResourceSaver.save(saved_game,"user://savegame.tres")



func Load(): # błąd gdy to wykonuje się jako pierwsze to crash jest gierki
	var saved_game:SavedGame = load("user://savegame.tres") as SavedGame
	
	GlobalData.madness = saved_game.madness
	GlobalData.madness_max = saved_game.madness_max
	GlobalData.passion = saved_game.passion
	GlobalData.spirituality = saved_game.spirituality
	GlobalData.lore_states = saved_game.lore_states

func save_lore_status():
	var bedroom = get_tree().get_first_node_in_group("HouseGroup").get_node("Bedroom").get_node("%Bedroom")
	
	for block in bedroom.get_children():
		if block is Lore_blocks:
			# Zapisujemy stan każdego bloku pod jego nazwą
			GlobalData.lore_states[block.name] = {
				"visible": block.visible,
				"current": block.current
			}
