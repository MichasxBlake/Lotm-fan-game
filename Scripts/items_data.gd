extends VBoxContainer
class_name Items

@export var activate : Button
@export var list : HBoxContainer
@export var text_name : String
@export var vbox_size : VBoxContainer

var tween : Tween
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	activate.button_down.connect(show_text)
	
func show_text() -> void:
	if tween:
		tween.kill()
		
	tween = create_tween()
	if !activate.button_pressed:
		list.hide()
		activate.text = "> " + text_name
	elif activate.button_pressed:
		list.show()
		activate.text = "V " + text_name


func _on_desire_passion_mouse_entered() -> void:
	pass
