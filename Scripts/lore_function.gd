extends Node
#to zrobilem z gemini
signal block_vanished # Nazwa musi być spójna w całym projekcie

#reward for loop
func loop(number : int, button : int, reward):
	give_reward(reward)



#reward for action + showing new blocks
func action(number, button, max_val, current, inside_number, place, reward):
	give_reward(reward)
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
		var command = place_find.get_child(number+1)
		command.show_new_lore(inside_number)


# reward from infinity blocks
func infinity(reward):
	give_reward(reward)

func give_reward(reward):
	if reward.size() == 0:
		return
	else:
		for i in reward:
			GlobalData[i] += reward[i]
