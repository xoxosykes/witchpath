extends Node2D

@onready var konskie_gadanko: Panel = $Konskie_gadanko
@onready var konski_sekret: Label = $Konskie_gadanko/Konski_sekret
@onready var konski_niepokoj: Label = $Konskie_gadanko/Konski_niepokoj
@onready var interakcja: Interakcja = $Kon_morski/Interakcja



var active = false 

func _ready() -> void:
	interakcja.interact = Callable(self, "_on_interact")
	if konskie_gadanko:
		konskie_gadanko.visible = !konskie_gadanko.visible
func _on_interact():
	konskie_gadanko.visible = !konskie_gadanko.visible
	print("Działa")


func _on_portal_area_body_entered(body: Node2D) -> void:
	if body is Wiedzma:
		get_tree().change_scene_to_file("res://Sceny/the_end.tscn")
