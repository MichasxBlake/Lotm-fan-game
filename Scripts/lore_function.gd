extends Node
#to zrobilem z gemini
signal block_vanished # Nazwa musi być spójna w całym projekcie
signal new_quest
signal new_lore

func _ready() -> void:
	add_to_group("Blocks_of_Lore")

#reward for loop
func loop(reward):
	give_reward(reward)



#reward for action + showing new blocks
func action(button, max_val, current, reward):
	give_reward(reward, max_val, current)
	if current >= max_val:
		var new_but = instance_from_id(button) as ProgressBar
		if new_but:
			new_but.hide() # Ukrywamy blok
		block_vanished.emit()

# reward from infinity blocks
func infinity(reward):
	give_reward(reward)

func give_reward(reward,max_val = 0,  current = 0):
	if reward.size() == 0:
		return
	else:
		for i in reward:
			if i == "Sleep":
				new_quest.emit()
			elif i == "Quest":
				GlobalData.list_of_quest.append(reward[i])
			elif i == "new_lore_id":
				GlobalData[i] = reward[i]
				new_lore.emit()
			elif i == "Multiple":
				for j in reward[i]:
					if int(j) == current:
						for g in reward[i][j]:
							GlobalData[g] += reward[i][j][g]
			else:
				GlobalData[i] += reward[i]
