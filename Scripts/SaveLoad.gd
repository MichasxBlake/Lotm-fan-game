extends Node
class_name SaveLoader

func _ready() -> void:
	Load()

func Save():
	var saved_game:SavedGame = SavedGame.new()
	
	saved_game.madness = GlobalData.madness
	saved_game.madness_max = GlobalData.madness_max
	saved_game.spirituality = GlobalData.spirituality
	
	ResourceSaver.save(saved_game,"user://savegame.tres")



func Load(): # błąd gdy to wykonuje się jako pierwsze to crash jest gierki
	var saved_game:SavedGame = load("user://savegame.tres") as SavedGame
	
	GlobalData.madness = saved_game.madness
	GlobalData.madness_max = saved_game.madness_max
	GlobalData.spirituality = saved_game.spirituality
