extends Control

@onready var controls: Button = $Options/controls
@onready var controlki: Control = $"."



func _on_back_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Options.tscn")
