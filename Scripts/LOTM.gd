extends Control

#buttons
@onready var loen_kingdom: Button = $"Main Window/Background/Działanie/Locations/ColorRect/Menu_of_locations/Loen Kingdom"
@onready var intis: Button = $"Main Window/Background/Działanie/Locations/ColorRect/Menu_of_locations/Intis"
@onready var tingen_button: Button = $"Main Window/Background/Działanie/Locations/ColorRect/Menu_of_locations/Loen/ColorRect/ScrollContainer/VBoxContainer/tingen"
@onready var backlund_button: Button = $"Main Window/Background/Działanie/Locations/ColorRect/Menu_of_locations/Loen/ColorRect/ScrollContainer/VBoxContainer/backlund"
@onready var trier_button: Button = $"Main Window/Background/Działanie/Locations/ColorRect/Menu_of_locations/Loen/ColorRect/ScrollContainer/VBoxContainer/trier"
@onready var show_logs: Button = $"Main Window/Background/HBoxContainer/VBoxContainer/ColorRect/Log_box/ColorRect/show_logs"





#windows
@onready var tingen: MarginContainer = $"Main Window/Background/Działanie/Tingen"
@onready var backlund: MarginContainer = $"Main Window/Background/Działanie/Backlund"
@onready var okno_3: MarginContainer = $"Main Window/Background/Działanie/Okno3"
@onready var okno_4: MarginContainer = $"Main Window/Background/Działanie/Okno4"

#others
@onready var loen: VBoxContainer = $"Main Window/Background/Działanie/Locations/ColorRect/Menu_of_locations/Loen"
@onready var intis_but: VBoxContainer = $"Main Window/Background/Działanie/Locations/ColorRect/Menu_of_locations/intis_but"
@onready var scroll_container: ScrollContainer = $"Main Window/Background/HBoxContainer/VBoxContainer/ColorRect/Log_box/ColorRect/ScrollContainer"
@onready var items_window: ColorRect = $"Main Window/Background/HBoxContainer/VBoxContainer/ColorRect/Items"


#my variable
@onready var what_okno: int = 0
@onready var what_but: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#państwa
	loen_kingdom.button_down.connect(loen_show)
	intis.button_down.connect(intis_show)
	#miasta
	tingen_button.button_down.connect(tingen_show)
	backlund_button.button_down.connect(backlund_show)
	trier_button.button_down.connect(trier_show)
	
	
	
	
	#Logs
	scroll_container.set_deferred("scroll_vertical", scroll_container.get_v_scroll_bar().max_value)
	show_logs.button_down.connect(logs_show)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event) -> void:
	if event.is_action_pressed("Escape"):
		get_tree().change_scene_to_file("res://Scenes/control.tscn")
		
	
	
#Pokazywanie państw
func loen_show() -> void:
	var temp_but = what_but
	what_but = 0
	loen.show()
	if temp_but == what_but :
		pass
	else:
		which_but(temp_but)

func intis_show() -> void:
	var temp_but = what_but
	what_but = 1
	intis_but.show()
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

		
	
	
