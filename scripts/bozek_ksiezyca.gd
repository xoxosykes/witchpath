extends Node2D
	
@onready var boza_wiadomosc: Panel = $"../boza_wiadomosc"
@onready var hejka: Label = $"../boza_wiadomosc/hejka"


func _ready() -> void:
	boza_wiadomosc.visible = false
	hejka.visible = false
	
func _on_area_2d_mouse_entered() -> void:
	pass
	
func _on_area_2d_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		boza_wiadomosc.visible = not boza_wiadomosc.visible
		hejka.visible = not hejka.visible
		get_viewport().set_input_as_handled()
 
	
