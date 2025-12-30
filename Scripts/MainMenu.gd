extends Control


@onready var button: Button = $MarginContainer/ColorRect/HBoxContainer/VBoxContainer/Button
@onready var button_2: Button = $MarginContainer/ColorRect/HBoxContainer/VBoxContainer/Button2
@onready var main_game = preload("res://Scenes/game.tscn")
@onready var save : SaveLoader = SaveLoader.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.button_down.connect(test)
	button_2.button_down.connect(exit)
	#get_viewport().size = DisplayServer.screen_get_size()  -> make bugs


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func test() -> void:
	get_tree().change_scene_to_packed(main_game)
	
	
func exit() -> void:
	save.Save()
	get_tree().quit()
