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
	GlobalData.value_changed.connect(money)
	
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

func money():
	if GlobalData.pence >= 12:
		GlobalData.pence -= 12
		GlobalData.soli +=1
	if GlobalData.soli >= 20:
		GlobalData.soli -=20
		GlobalData.pounds +=1
