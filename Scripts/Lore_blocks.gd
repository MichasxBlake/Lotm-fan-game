extends ProgressBar
class_name Lore_blocks

@export var button_type : String
@export var time_to_done : int
@export var current_max : String
@export var current : int
@export var number : int
@export var inside_number : int
@export var place : String
@export var money_type : String
@export var cost : int
@export var increase : float
@onready var label: Label = $Button/Label
@onready var label_2: Label = $Button/Label2
@onready var label_3: Label = $Button/HBoxContainer/Label3
@onready var label_4: Label = $Button/HBoxContainer/Label4
@onready var lore_1: Lore_blocks = $"."
@onready var timer: Timer = $Timer
@onready var button: Button = $Button
@onready var panel_container_2: PanelContainer = $CanvasLayer/PanelContainer2
@onready var button_cost: Label = $Button/Label3

var do = false
var buying = false




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lore_1.value = 0
	label.text = button_type
	label_2.text = str(time_to_done)
	if current_max != "0":
		label_4.text = "/" + current_max
	timer.wait_time = time_to_done
	lore_1.max_value = time_to_done
	GlobalData.value_changed.connect(can_buy)
	if money_type and cost:
		button_cost.text = money_type + ": "+ str(cost)
	await get_tree().process_frame
	if place == "House" and number == 0:
		if GlobalData.lore_states.has(self.name):
			var saved_data = GlobalData.lore_states[self.name]
			
			# Przywracamy widoczność
			self.visible = saved_data["visible"]
			
			# Przywracamy postęp (opłacenie)
			self.current = saved_data["current"]
	
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
# Fragment funkcji _on_button_toggled [cite: 8]
		elif button_type == "Action":
			if money_type == "Passion" and GlobalData.passion >= cost:
				GlobalData.passion -= cost
				cost *= increase
				buying = true
			button_cost.text = money_type + ": "+ str(cost)
			if buying:
				if current >= int(current_max):
					var new_id = get_instance_id()
					# Wywołujemy grupę, która obsługuje logikę [cite: 8]
					get_tree().call_group("Lore_events", "action", number, new_id, int(current_max), current, inside_number, place)
				else:
					if panel_container_2.get_child_count() > current:
						panel_container_2.get_child(current-1).hide()
						panel_container_2.get_child(current).show()

				current +=1
				button.button_pressed = false
				buying = false
	else:
		timer.start()
		timer.paused = true
		
func can_buy():
	if button_type == "Action":
		if money_type == "Passion":
			if GlobalData.passion >= cost:
				button.disabled = false
			else:
				button.disabled = true
	else:
		button.disabled = false
	
