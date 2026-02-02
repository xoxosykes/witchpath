extends Node2D

@onready var konskie_gadanko: Panel = $Konskie_gadanko
@onready var konski_sekret: Label = $Konskie_gadanko/Konski_sekret
@onready var konski_niepokoj: Label = $Konskie_gadanko/Konski_niepokoj
var active = false 

func _ready() -> void:
	konski_sekret.visible = false
	konski_niepokoj.visible = false
	konskie_gadanko.visible = false
func _on_area_2d_mouse_entered() -> void:
	pass

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("klik")
		konski_sekret.visible = active
		konski_niepokoj.visible = active
		konskie_gadanko.visible = active
		get_viewport().set_input_as_handled()
 
