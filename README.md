# Lotm fan game
Idle game I'm making of lotm
	# here is incresing soli by 1 second = GlobalData.pence +=0.4



TODO:
	
	* change how locations work so it's more simple button pressed - > show, button unpressed -> hide() (class)
	* better gui (I hate it)
	* Change whole code with new knowlage of classes
	* new items class = potions: potion name + ingredience only if you hover on it, on dislpay it shows number of ingredience and max needed
	* let player edit how long it take to save data in game = DONE
	* dark ritual = diegestion reset, to do this player need to concoct new potion from beginning or concoct potion with element of other beyonder with others sequences
	* make tooltip change direction when outside scene
	@ podświetlanie guzik
	
	
	
	if  visibility == 0:
		a = true
		print("xd")
		color_rect.hide()
	if a:
		color_rect.show()
		print("a")




func _ready() -> void:
	number = bedroom.get_child_count()
	for node in bedroom.get_children():
		if !node.is_visible_in_tree():
			hidden_count += 1
			a = hidden_count-1
		else:
			visable_count += 1
			

	label.text = "V " + text
	color_rect.custom_minimum_size = Vector2(60 + (190*((number-hidden_count)-1)),80)
	current_size = color_rect.custom_minimum_size
	visable_count = 0
	hidden_count = 0
	
func _process(delta: float) -> void:
	print(bedroom.get_child_count(),number)
	if bedroom.get_child_count() == number-1:
		print(number)
		visable_count = 0
		hidden_count = 0
		for node in bedroom.get_children():
			if !node.is_visible_in_tree():
				hidden_count += 1
			else:
				visable_count += 1
		visibility = visable_count
		number -= 1
		color_rect.custom_minimum_size = Vector2(60 + (190*(visable_count)),80)
		current_size = color_rect.custom_minimum_size
