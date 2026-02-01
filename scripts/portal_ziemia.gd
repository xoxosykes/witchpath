extends Node2D

func _on_wykrywanie_body_entered(body: Node2D) -> void:
	if body is Wiedzma:
		get_tree().change_scene_to_file("res://Sceny/moon_level.tscn")
