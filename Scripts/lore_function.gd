extends Node
#to zrobilem z gemini
signal block_vanished # Nazwa musi być spójna w całym projekcie

func loop(number : int, button : int):
	GlobalData.passion += 50

func action(number, button, max_val, current, inside_number, place):
	if current >= max_val:
		var new_but = instance_from_id(button) as ProgressBar
		if new_but:
			new_but.hide() # Ukrywamy blok
		block_vanished.emit()

	if place == "House":
		var place_find = get_node("../../%House")
		var command = place_find.get_child(number+1)
		command.show_new_lore(inside_number)
	if place == "Street":
		var place_find = get_node("../../%Street")
		print(place_find)
		var command = place_find.get_child(number+1)
		print(command)
		command.show_new_lore(inside_number)

	
