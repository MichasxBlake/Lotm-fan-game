extends HBoxContainer

@onready var food: Label = $VBoxContainer/Desire_Passion/Label3
@onready var spirituality: Label = $VBoxContainer/Spirituality/Label2
@onready var spirituality_max: Label = $VBoxContainer/Spirituality/Label3
@onready var madness: Label = $VBoxContainer/Madness/Label2
@onready var madness_max: Label = $VBoxContainer/Madness/Label3
@onready var mind_power: Label = $VBoxContainer/Mind_power/Label2
@onready var mind_power_max: Label = $VBoxContainer/Mind_power/Label3
@onready var depas_name: Label = $VBoxContainer/Desire_Passion/Label
@onready var rich_text_label: RichTextLabel = $"../Control/PanelContainer5/RichTextLabel"
@onready var rich_text_label_2: RichTextLabel = $"../Control/PanelContainer5/RichTextLabel2"




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalData.food_changed.connect(changing)
	changing()


func changing():
	var there_is_floor = 0
	var value_food = 0
	var end_text = ""
	end_text += "[center][b]Food:[/b][/center]"
	for i in GlobalData.food:
		value_food += GlobalData.food[i]
		end_text += ("\n"+ i.replace("_", " ") + " : " + str(GlobalData.food[i]))
	food.text = str(value_food)
	end_text += ("\n————————— \nAmount: " + str(value_food))
	rich_text_label.text = end_text
	
