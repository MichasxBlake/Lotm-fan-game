extends Node


# Called when the node enters the scene tree for the first time.
func loop(xd : int, button : int):
	print(1+xd)

func action(xd : int, button : int, max : int, current : int):
	
	if xd == 1:
		if max < current:
			pass
		else:
			var new_but : ProgressBar = instance_from_id(button)
			new_but.get_parent().remove_child(new_but)
			new_but.queue_free()
			
		
		
