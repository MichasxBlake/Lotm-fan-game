extends Node
#sygnały

signal value_changed


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
		value_changed.emit()
var passion_max = 100
var madness : int =0:
	set(v):
		madness = v
		value_changed.emit()
var madness_max = 101
var spirituality : int = 0:
	set(v):
		spirituality = v
		value_changed.emit()
var spirituality_max = 40
var mind_power : int = 0:
	set(v):
		mind_power = v
		value_changed.emit()
var mind_power_max = 10

func _process(delta: float) -> void:
	if passion > passion_max:
		passion = passion_max
	if madness > madness_max:
		madness = madness_max
	if spirituality > spirituality_max:
		spirituality = spirituality_max
	if mind_power > mind_power_max:
		mind_power = mind_power_max
