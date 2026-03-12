extends Node
#sygnały

signal value_changed
signal log_udpate
signal food_changed
signal time_changed

var is_night = false

#money
var pounds : int = 0:
	set(v):
		pounds = v
		value_changed.emit()
var soli : int = 0:
	set(v):
		soli = v
		value_changed.emit()
var pence : int = 0:
	set(v):
		pence = v
		value_changed.emit()

#you
var passion : int = 0:
	set(v):
		passion = v
		max_passion()
		value_changed.emit()
var passion_max : int = 0:
	set(v):
		passion_max = v
		value_changed.emit()
var madness : int = 5:
	set(v):
		madness = v
		value_changed.emit()
		max_madness()
var madness_max : int = 0:
	set(v):
		madness_max = v
		value_changed.emit()
var spirituality : int = 0:
	set(v):
		spirituality = v
		value_changed.emit()
		max_spirituality()
var spirituality_max : int = 0:
	set(v):
		spirituality_max = v
		value_changed.emit()
var mind_power : int = 0:
	set(v):
		mind_power = v
		value_changed.emit()
		max_mind_power()
var mind_power_max : int = 0:
	set(v):
		mind_power_max = v
		value_changed.emit()

#needs:
		
var food : Dictionary = {"bread" : 0, "potatoes" : 0, "cheap_meat" : 0}

func set_food(item_name: String, operator : String, amount: int):
	if food.has(item_name):
		if operator == "+":
			food[item_name] += amount
		elif operator == "-":
			food[item_name] -= amount
		else:
			food[item_name] = amount
		food_changed.emit()

var logs : String = "":
	set(t):
		logs = t
		var number = logs.split("\n")
		if number.size() >= 62:
			print("ahoj?")
			number.remove_at(0)
			number.remove_at(0)
			logs = "\n".join(number)
		logs += "\n"
		log_udpate.emit()

func max_passion():
	if passion > passion_max:
		passion = passion_max
func max_madness():
	if madness > madness_max:
		madness = madness_max
func max_spirituality():
	if spirituality > spirituality_max:
		spirituality = spirituality_max
func max_mind_power():
	if mind_power > mind_power_max:
		mind_power = mind_power_max
		
var lore_states = {} # Format: {"NazwaBloku": {"visible": true, "current": 5}}

var list_of_quest = []

var time_of_day : int = 0:
	set(y):
		time_of_day = y
		if time_of_day > 100:
			time_of_day -=100
		day()

func day():
	print(time_of_day)
	if time_of_day >= 100:
		if is_night:
			is_night = false
			time_changed.emit()
		else:
			is_night = true
			time_changed.emit()


var new_lore_id = 0

var sleepness : int = 0:
	set(v):
		sleepness = v
		value_changed.emit()
