extends Control


@onready var save : SaveLoader = SaveLoader.new()

#buttons
@onready var show_logs: Button = $"Main Window/Background/VBoxContainer/HBoxContainer/HBoxContainer/VBoxContainer/ColorRect/Log_box/ColorRect/show_logs"
@onready var intis: Button = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Your Journey/Locations/ColorRect/Menu_of_locations/Intis"
@onready var loen_kingdom: Button = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Your Journey/Locations/ColorRect/Menu_of_locations/Loen Kingdom"
@onready var tingen_button: Button = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Your Journey/Locations/ColorRect/Menu_of_locations/Loen/ColorRect/ScrollContainer/VBoxContainer/tingen"
@onready var backlund_button: Button = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Your Journey/Locations/ColorRect/Menu_of_locations/Loen/ColorRect/ScrollContainer/VBoxContainer/backlund"
@onready var trier_button: Button = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Your Journey/Locations/ColorRect/Menu_of_locations/Loen/ColorRect/ScrollContainer/VBoxContainer/trier"
@onready var quest_show: Button = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Your Journey/HBoxContainer/Locations/ColorRect/Menu_of_locations/Quest_Show"


@onready var logs_text: Label = $"Main Window/Background/VBoxContainer/HBoxContainer/HBoxContainer/VBoxContainer/ColorRect/Log_box/ColorRect/ScrollContainer/Label"



#windows
@onready var tingen: MarginContainer = $"Main Window/Background/Your Journey/Tingen"
@onready var backlund: MarginContainer = $"Main Window/Background/Your Journey/Backlund"
@onready var okno_3: MarginContainer = $"Main Window/Background/Działanie/Okno3"
@onready var okno_4: MarginContainer = $"Main Window/Background/Działanie/Okno4"
@onready var settings: Control = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Settings"
@onready var your_journey: Control = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Your Journey"

#others
@onready var loen: VBoxContainer = $"Main Window/Background/Działanie/Locations/ColorRect/Menu_of_locations/Loen"
@onready var intis_but: VBoxContainer = $"Main Window/Background/Działanie/Locations/ColorRect/Menu_of_locations/intis_but"
@onready var items_window: ColorRect = $"Main Window/Background/VBoxContainer/HBoxContainer/HBoxContainer/VBoxContainer/ColorRect/Items"
@onready var progress_bar: ProgressBar = $"Main Window/Background/Działanie/Tingen/ColorRect/House/ColorRect2/ScrollContainer/Control/ProgressBar"
@export var menu_group : ButtonGroup
@onready var scroll_container: ScrollContainer = $"Main Window/Background/VBoxContainer/HBoxContainer/HBoxContainer/VBoxContainer/ColorRect/Log_box/ColorRect/ScrollContainer"
@onready var quests: ColorRect = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Your Journey/HBoxContainer/Locations/ColorRect/Menu_of_locations/Quests"
@onready var quest_list: VBoxContainer = $"Main Window/Background/VBoxContainer/HBoxContainer/Control/Your Journey/HBoxContainer/Locations/ColorRect/Menu_of_locations/Quests/Quest_block/ScrollContainer/Quest_list"


#my variable
@onready var what_okno: int = 0
@onready var what_but: int = 0
@onready var test: int = 0
signal night_block
signal day_block

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#menu
	for i in menu_group.get_buttons():
		i.connect("pressed",show_menu)
	var the_lore = get_tree().get_first_node_in_group("Blocks_of_Lore")
	if the_lore:
		the_lore.new_quest.connect(update_quest)
	
	#państwa
	#loen_kingdom.button_down.connect(loen_show)
	#intis.button_down.connect(intis_show)
	#miasta
	#tingen_button.button_down.connect(tingen_show)
	#backlund_button.button_down.connect(backlund_show)
	#trier_button.button_down.connect(trier_show)
	
	GlobalData.log_udpate.connect(change_logs)
	GlobalData.time_changed.connect(night_and_day)
	
	
	
	#Logs
	scroll_container.set_deferred("scroll_vertical", scroll_container.get_v_scroll_bar().max_value)
	show_logs.button_down.connect(logs_show)

func _input(event) -> void:
	if event.is_action_pressed("Escape"):
		get_tree().change_scene_to_file("res://Scenes/control.tscn")

#pokazywanie menu
func show_menu():
	var name = menu_group.get_pressed_button().name
	if name == "Your Journey":
		your_journey.show()
		settings.hide()
	elif name == "Settings":
		your_journey.hide()
		settings.show()
		

		
		
	
	
#Pokazywanie państw
func loen_show() -> void:
	var temp_but = what_but
	what_but = 0
	#loen.show()
	if temp_but == what_but :
		pass
	else:
		which_but(temp_but)

func intis_show() -> void:
	var temp_but = what_but
	what_but = 1
	if temp_but == what_but :
		pass
	else:
		which_but(temp_but)


#Pokazywanie lokacji
func tingen_show() -> void:
	var temp_okno = what_okno
	what_okno = 0
	tingen.show()
	if temp_okno == what_okno:
		pass
	else:
		which_okno(temp_okno)
func backlund_show() -> void:
	var temp_okno = what_okno
	what_okno = 1
	backlund.show()
	if temp_okno == what_okno:
		pass
	else:
		which_okno(temp_okno)
func trier_show() -> void:
	var temp_okno = what_okno
	what_okno = 2
	okno_3.show()
	if temp_okno == what_okno:
		pass
	else:
		which_okno(temp_okno)
func pokaz4() -> void:
	var temp_okno = what_okno
	what_okno = 3
	okno_4.show()
	if temp_okno == what_okno:
		pass
	else:
		which_okno(temp_okno)
	
	
#testing what to do
func which_okno(temp_okno) -> void:
	if temp_okno == 0:
		tingen.hide()
	if temp_okno == 1:
		backlund.hide()
	if temp_okno == 2:
		okno_3.hide()
	if temp_okno == 3:
		okno_4.hide()

func which_but(temp_but) -> void:
	if temp_but == 0:
		loen.hide()
	if temp_but == 1:
		intis_but.hide()


#Logi
func logs_show() -> void:
	if !show_logs.button_pressed:
		items_window.hide()
		show_logs.text = "v"
	elif show_logs.button_pressed:
		items_window.show()
		show_logs.text = "^"


func _on_button_button_down() -> void:
	GlobalData.set_food("bread","+",3)
	GlobalData.pence +=1
	GlobalData.logs += "\n"+str(test)
	test +=1
	
func change_logs():
	logs_text.text = GlobalData.logs
	scroll_container.set_deferred("scroll_vertical", scroll_container.get_v_scroll_bar().max_value)


	
	


func _on_exit_button_down() -> void:
	save.Save()


func _on_quest_show_toggled(toggled_on: bool) -> void:
	if toggled_on:
		quest_show.text = "^ Show Quests"
		quests.hide()
	else:
		quest_show.text = "V Hide Quests"
		quests.show()

func update_quest():
	for i in GlobalData.list_of_quest:
		print(i)
		var temp_quest = quest_list.get_child(i-1)
		print(temp_quest)
		temp_quest.show()












# NIGHT AND DAY CYCLE IS HERE, THIS TEXT IS TOTALLY NOT WAY TOO LONG FOR JUST TYPICAL COMMENT


func night_and_day():
	if GlobalData.is_night:
		get_tree().call_group("day_or_night", "is_night")
		GlobalData.logs += "night fell"
	else:
		get_tree().call_group("day_or_night", "is_day")
		GlobalData.logs += "day has risen"


func day_maybe() -> void:
	GlobalData.time_of_day += 50
