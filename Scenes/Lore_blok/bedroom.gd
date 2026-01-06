extends ColorRect
class_name Lore_Slide

@export var text: String
@export var label : Label
@export var color_rect: ColorRect
@export var bedroom: HBoxContainer
@onready var number : int = bedroom.get_child_count()
@onready var clicked = false
@onready var current_size = color_rect.size

func _ready() -> void:
	label.text = "V " + text
	color_rect.custom_minimum_size = Vector2(249 + (190 * (number-2)),80)
	
func _process(delta: float) -> void:
	if bedroom.get_child_count() == 1:
		color_rect.hide()
	if bedroom.get_child_count() == number-1:
		color_rect.custom_minimum_size = Vector2(color_rect.size.x-190,80)
		number -= 1
		current_size = color_rect.custom_minimum_size





func _on_button_button_down() -> void:
	if clicked == false:
		bedroom.hide()
		color_rect.custom_minimum_size = Vector2(30,80)
		clicked = true
	elif clicked == true:
		bedroom.show()
		color_rect.custom_minimum_size = Vector2(current_size.x-61,80)
		clicked = false

func show_new_lore(inside_number : int):
	bedroom.get_child(inside_number+1).show()
