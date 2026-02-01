extends Area2D

signal water_state_changed(in_water : bool)

var in_water : bool = false;

func _on_body_entered(body) -> void:
	if(in_water == false):
		var overlapping_bodies = get_overlapping_bodies()
		if(overlapping_bodies.size() >= 1):
			in_water = true
			emit_signal("water_state_changed", in_water)

func _on_body_exited(body) -> void:
	var overlapping_bodies = get_overlapping_bodies()
	if(overlapping_bodies.size() == 0):
		in_water = false
		emit_signal("water_state_changed", in_water)
