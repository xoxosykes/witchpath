extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options


func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceny/test.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Options.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceny/controlsy.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceny/credits.tscn")
