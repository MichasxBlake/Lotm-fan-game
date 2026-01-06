extends Node


# Called when the node enters the scene tree for the first time.
func loop(number : int, button : int):
	GlobalData.passion += 1

func action(number : int, button : int, max : int, current : int, inside_number: int, place : String):
	
	if max < current:
		pass
	else:
		var new_but : ProgressBar = instance_from_id(button)
		new_but.get_parent().remove_child(new_but)
		new_but.queue_free()
	if place == "House" :
		var place_find = get_node("../../%House")
		var command = place_find.get_child(number+1)
		command.show_new_lore(inside_number)
		print(command)
