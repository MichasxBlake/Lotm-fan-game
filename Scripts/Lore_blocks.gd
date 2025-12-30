extends ProgressBar
class_name Lore_blocks

@export var button_type : String
@export var time_to_done : int
@export var max : String
@export var current : int
@onready var label: Label = $Button/Label
@onready var label_2: Label = $Button/Label2
@onready var label_3: Label = $Button/HBoxContainer/Label3
@onready var label_4: Label = $Button/HBoxContainer/Label4
@onready var lore_1: Lore_blocks = $"."
@onready var timer: Timer = $Timer
var do = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lore_1.value = 0
	label.text = button_type
	label_2.text = str(time_to_done)
	label_4.text = "/" + max
	label_3.text = str(current)
	timer.wait_time = time_to_done
	lore_1.max_value = time_to_done
	
func _process(delta: float) -> void:
	if do:
		lore_1.value = timer.wait_time - timer.time_left
	if timer.time_left == 0:
		do = false


func _on_button_button_down() -> void:
	do = true
	timer.start()
	get_tree().call_group("Lore_events","abc", 20)
