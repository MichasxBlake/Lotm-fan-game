extends HBoxContainer

@onready var desire: Label = $VBoxContainer/Desire_Passion/Label2
@onready var desire_max: Label = $VBoxContainer/Desire_Passion/Label3
@onready var spirituality: Label = $VBoxContainer/Spirituality/Label2
@onready var spirituality_max: Label = $VBoxContainer/Spirituality/Label3
@onready var madness: Label = $VBoxContainer/Madness/Label2
@onready var madness_max: Label = $VBoxContainer/Madness/Label3
@onready var mind_power: Label = $VBoxContainer/Mind_power/Label2
@onready var mind_power_max: Label = $VBoxContainer/Mind_power/Label3



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spirituality.text = str(GlobalData.spirituality)
	spirituality_max.text = "/ "+str(GlobalData.spirituality_max)
	madness.text = str(GlobalData.madness)
	madness_max.text = "/ "+str(GlobalData.madness_max)
	mind_power.text = str(GlobalData.mind_power)
	mind_power_max.text = "/ "+str(GlobalData.mind_power_max)
	
