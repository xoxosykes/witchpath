extends CanvasLayer

func _ready() -> void:
	visible = false
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	if get_tree().paused:
		visible = false
		get_tree().paused = false
	else:
		visible = true
		get_tree().paused = true

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceny/main_menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceny/options.tscn")


func _on_resume_game_pressed() -> void:
	visible = false
	get_tree().paused = false
