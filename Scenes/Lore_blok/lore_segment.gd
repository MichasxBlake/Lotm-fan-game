extends HBoxContainer
# Jeśli błąd z "hides global script class" wróci, usuń linię poniżej
class_name Lore_slide

@export var text: String
@export var label : Label
@export var color_rect: ColorRect
@export var lore_place: HBoxContainer
@export var top_body : HBoxContainer

var clicked = false
var current_size : Vector2
var size_tween : Tween

func _ready() -> void:
	add_to_group("lore_segment")
	# W Twoim game.tscn ten węzeł jest w grupie "Lore_events"
	var event_handler = get_tree().get_first_node_in_group("Lore_events") # nie rozumiem
	
	if event_handler and event_handler.has_signal("block_vanished"):
		# Łączymy się z sygnałem block_vanished 
		event_handler.block_vanished.connect(refresh_ui)
	
	label.text = "V " + text
	
	refresh_ui(true)

func refresh_ui(instant: bool = false, check : bool = false) -> void: # jeśli coś nie działa to dlatego że usunąłem check (sprawdz poniżej)
	var a = 0
	var visible_count = 0
	# Liczymy tylko widoczne bloki lore wewnątrz kontenera bedroom [cite: 33]
	for node in lore_place.get_children():
		if node is ProgressBar and node.visible:   #super mądre muszę zapamiętać
			visible_count += 1
	if visible_count == 0: # w tym varunku był jeszcze if check, jak coś nie działa to tutaj zmienić
		top_body.hide()
	else:
		top_body.show()
		var new_width = 220 + (190 * max(0, visible_count - 1))
		if size_tween:
			size_tween.kill()
		if instant:
			color_rect.custom_minimum_size = Vector2(new_width,80)
		size_tween = create_tween()
		size_tween.set_trans(Tween.TRANS_QUINT)
		size_tween.set_ease(Tween.EASE_OUT)
		size_tween.tween_property(color_rect,"custom_minimum_size",Vector2(new_width,80),0.5)
		# Obliczamy rozmiar paska [cite: 33]

		current_size = color_rect.custom_minimum_size


func show_new_lore(inside_number : int):
	var node = lore_place.get_node_or_null(str(inside_number))   #GET_NODE_OR_NULL ważne do zapamiętania
	if node:
		node.show()
		refresh_ui()

func _on_button_button_down() -> void:
	clicked = !clicked
	
	if size_tween:
		size_tween.kill()
	size_tween = create_tween()
	size_tween.set_trans(Tween.TRANS_QUINT)
	size_tween.set_ease(Tween.EASE_OUT)
	
	if clicked:
		lore_place.hide()
		size_tween.tween_property(color_rect, "custom_minimum_size", Vector2(0, 80), 0.3)
	else:
		lore_place.show()
		size_tween.tween_property(color_rect, "custom_minimum_size", Vector2(current_size.x, 80), 0.3)
		refresh_ui()
