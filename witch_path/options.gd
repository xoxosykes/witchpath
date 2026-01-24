extends Control


func _on_back_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceny/main_menu.tscn")
	

func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceny/controlsy.tscn")
