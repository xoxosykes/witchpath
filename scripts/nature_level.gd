extends Node2D

@onready var bozyszczowe_bajdurzenie: Panel = $bozyszczowe_bajdurzenie
@onready var interakcja: Interakcja = $bozyszcze_lesne/Interakcja



var active = false 

func _ready() -> void:
	interakcja.interact = Callable(self, "_on_interact")
	if bozyszczowe_bajdurzenie:
		bozyszczowe_bajdurzenie.visible = !bozyszczowe_bajdurzenie.visible
func _on_interact():
	bozyszczowe_bajdurzenie.visible = !bozyszczowe_bajdurzenie.visible
	print("Działa")
