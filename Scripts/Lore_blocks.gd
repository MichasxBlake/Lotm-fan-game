extends ProgressBar
class_name Lore_blocks

@export var button_type : String
@export var time_to_done : int
@export var current_max : String
@export var current : int
@export var number : int
@export var inside_number : int
@export var place : String
@onready var label: Label = $Button/Label
@onready var label_2: Label = $Button/Label2
@onready var label_3: Label = $Button/HBoxContainer/Label3
@onready var label_4: Label = $Button/HBoxContainer/Label4
@onready var lore_1: Lore_blocks = $"."
@onready var timer: Timer = $Timer
@onready var button: Button = $Button
@onready var rich_text_label: RichTextLabel = $CanvasLayer/PanelContainer2/RichTextLabel
@onready var panel_container_2: PanelContainer = $CanvasLayer/PanelContainer2

var do = false




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lore_1.value = 0
	label.text = button_type
	label_2.text = str(time_to_done)
	if current_max != "0":
		label_4.text = "/" + current_max
	timer.wait_time = time_to_done
	lore_1.max_value = time_to_done
	
func _process(delta: float) -> void:
	if do:
		lore_1.value = timer.wait_time - timer.time_left
	if timer.time_left == 0:
		do = false
	if current_max != "0":
		label_3.text = str(current)


func _on_timer_timeout() -> void:
	var new = lore_1.get_instance_id()
	get_tree().call_group("Lore_events","loop", number,new)


func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		var new = lore_1.get_instance_id()
		if button_type == "Loop":
			timer.paused = false
			do = true
			timer.start()
		elif button_type == "Action":
			if current == int(current_max):
				get_tree().call_group("Lore_events","action", number,new,int(current_max),current, inside_number, place)
			else:
				panel_container_2.get_child(current-1).hide()
				panel_container_2.get_child(current).show()
				GlobalData.madness +=1
			current +=1
			button.button_pressed = false
	else:
		timer.start()
		timer.paused = true
