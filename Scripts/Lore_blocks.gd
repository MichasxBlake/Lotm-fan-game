extends ProgressBar
class_name Lore_blocks
signal block_vanished

@export var button_type : String
@export var Infinity : bool = false
@export var time_to_done : float
@export var button_text : String
@export var info_text : Dictionary
@export var current_max : String
@export var current : int
@export var money_type : String
@export var cost : int
@export var increase : Array
@export var reward : Dictionary
@export var day_or_night : String
@export var this_id : int
@onready var used_already = false
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
	await get_tree().process_frame
	
	button.text = button_text
	panel_container_2.get_child(0).text = str(info_text.get(0))
	
	var event_handler = get_tree().get_first_node_in_group("Lore_events") # nie rozumiem
	
	if event_handler and event_handler.has_signal("new_lore"):
		# Łączymy się z sygnałem block_vanished 
		event_handler.block_vanished.connect(new_lore)
	
	add_to_group("day_or_night")
	can_buy()
	lore_1.value = 0
	label.text = button_type
	if time_to_done > 0:
		label_2.text = str(time_to_done)
		timer.wait_time = time_to_done
		lore_1.max_value = time_to_done
	if current_max != "0":
		label_4.text = "/" + current_max
	GlobalData.value_changed.connect(can_buy)
	if money_type and cost:
		button_cost.text = money_type + ": "+ str(cost)
	show_reward()
	#saving
	
func _process(delta: float) -> void:
	if do:
		lore_1.value = timer.wait_time - timer.time_left
	if timer.time_left == 0:
		do = false
	if current_max != "0":
		label_3.text = str(current)


func _on_timer_timeout() -> void:
	if Infinity:
		get_tree().call_group("Lore_events", "infinity", reward)
		buy()
		if !buying:
			timer.start()
			timer.paused = true
	else:
		var new = lore_1.get_instance_id()
		get_tree().call_group("Lore_events","loop", reward)


func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		if button_type == "Loop":
			if Infinity:
				buy()
				if buying:
					timer.paused = false
					do = true
					timer.start()
					buying = false
			else:
				timer.paused = false
				do = true
				timer.start()
# Fragment funkcji _on_button_toggled [cite: 8]
		elif button_type == "Action":
			buy()
			if Infinity:
				if buying:
					button.button_pressed = false
					buying = false
					return
			elif buying:
				var new_id = get_instance_id()
				if current >= int(current_max):
					
					get_tree().call_group("Lore_events", "action", new_id, int(current_max), current, reward)
					print(GlobalData.madness, GlobalData.passion)
					used_already = true
				else:
					if panel_container_2.get_child_count() > current:
						panel_container_2.get_child(current).text = str(info_text.get(current))
						panel_container_2.get_child(current-1).hide()
						panel_container_2.get_child(current).show()
						get_tree().call_group("Lore_events", "action", new_id, int(current_max), current, reward)
						current +=1
						show_reward()

				button.button_pressed = false
				buying = false
	else:
		timer.start()
		timer.paused = true
		
func can_buy():
	if button_type == "Action" or (button_type == "Loop" and Infinity):
		if money_type != "":
			if GlobalData[money_type] >= cost:
				button.disabled = false
			else:
				button.disabled = true
				timer.start()
				timer.paused = true
				button.button_pressed = false
		else:
			button.disabled = false
	else:
		button.disabled = false
		
func buy():
	if money_type != "":
		if GlobalData[money_type] >= cost:
			GlobalData[money_type] -= cost
			if !Infinity and current != int(current_max):
				cost = increase[current-1]
			buying = true
			button_cost.text = money_type + ": "+ str(cost)
	else:
		buying = true

func show_reward():
	var exist = false
	var made_text = ""
	for i in reward:
		if i == "Sleep":
			made_text += ("\n[left]* {name_text} [/left]".format({"name_text" : i}))
		elif i == "Quest" or i == "new_lore_id" or i == "logs":
			exist = true
		else:
			if i == "Multiple":
				var temp_str
				var temp_name
				for j in reward[i]:
						if int(j) == current:
							for g in reward[i][j]:
								if g == "Quest" or g == "new_lore_id" or g == "logs":
									pass
								else:
									temp_str = reward[i][j][g]
									temp_name = g
				made_text += ("\n[left] {name_text} + {name_value} [/left]".format({"name_text" : temp_name , "name_value" : temp_str }))
			else:
				made_text += ("\n[left] {name_text} + {name_value} [/left]".format({"name_text" : i , "name_value" : reward[i]}))

	if exist and made_text == "":
		pass
	else:
		panel_container_2.get_child(current-1).append_text("\n\n[left] Reward: [/left]")
		panel_container_2.get_child(current-1).append_text(made_text)


func is_night():
	if day_or_night == "night":
		if ! used_already:
			show()
			get_tree().call_group("lore_segment", "refresh_ui")
	elif  day_or_night == "day":
		hide()
		get_tree().call_group("lore_segment", "refresh_ui")
		
func is_day():
	if day_or_night == "night":
		hide()
		get_tree().call_group("lore_segment", "refresh_ui")
	elif  day_or_night == "day":
		if ! used_already:
			show()
			get_tree().call_group("lore_segment", "refresh_ui")

func new_lore():
	if GlobalData.new_lore_id == this_id:
		show()
		get_tree().call_group("lore_segment", "refresh_ui")
