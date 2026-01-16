extends Node2D

func _process(delta):
	var magic_on = Input.is_action_pressed("toggle_magic_sense")  # F

	# wszystkie kwiaty z grupy glowing swieca
	for obj in get_tree().get_nodes_in_group("glowing"):
		if obj.has_method("toggle_magic_sense"):
			obj.toggle_magic_sense(magic_on)
