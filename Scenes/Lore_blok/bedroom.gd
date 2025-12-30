extends ColorRect
class_name Lore_Slide

@export var text: String
@onready var label: Label = $Bedroom/Button/Label

func _ready() -> void:
	label.text = "V " + text
