extends HBoxContainer

@onready var pound: Label = $VBoxContainer/Pound/Label2
@onready var soli: Label = $VBoxContainer/Soli/Label2
@onready var pence: Label = $VBoxContainer/Pence/Label2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pound.text = str(GlobalData.pounds)
	soli.text = str(GlobalData.soli)
	pence.text = str(GlobalData.pence)
