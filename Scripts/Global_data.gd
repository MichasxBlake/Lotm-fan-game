extends Node

#money
var pounds = 0
var soli = 0
var pence = 0

#you
var passion = 0 
var passion_max = 100
var madness = 0
var madness_max = 101
var spirituality = 1
var spirituality_max = 40
var mind_power = 0
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
