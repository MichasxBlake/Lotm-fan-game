extends Control

@onready var how_often_save = 0
@onready var saving = get_node("%Save_node")
@onready var timer: Timer = $Timer
@onready var save_info: Label = $"../../../Save_info"
@onready var info: Timer = $"../../../Save_info/Timer"
@onready var show_info = true
@onready var pressed = false
@onready var stop_save_info: Button = $ColorRect/VBoxContainer/stop_save_info

func _on_option_button_2_item_selected(index: int) -> void:
	if index == 0:
		timer.wait_time = 30
		timer.start()
	if index == 1:
		timer.wait_time =  60
		timer.start()
	if index == 2:
		timer.wait_time = 300
		timer.start()
	if index == 3:
		timer.wait_time = 600
		timer.start()



func _on_timer_timeout() -> void:
	saving.Save()
	if show_info == true:
		save_info.show()
		info.start()


func _on_button_button_down() -> void:
	saving.Load() 


func _on_timer_timeout2() -> void:
	save_info.hide()


func _on_stop_save_info_button_down() -> void:
	if pressed == false:
		show_info = false
		stop_save_info.text = "Show save info"
		pressed = true
	elif pressed == true:
		show_info = true
		stop_save_info.text = "Hide save info"
		pressed = false

func _on_resolution_item_selected(index: int) -> void:
	if index == 2:
		get_window().size = Vector2(1920,1080)
		print("C")
	elif index == 1:
		get_window().size = Vector2i(1680,1050)
		print("B")
	elif index == 0:
		get_window().size = Vector2(1600,900)
		print("A")


func aaaa() -> void:
	saving.Save()
