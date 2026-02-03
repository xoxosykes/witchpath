extends Node2D

@onready var boza_wiadomosc: Panel = $boza_wiadomosc
@onready var interakcja: Interakcja = $Bozek_ksiezyca/Interakcja




var active = false 

func _ready() -> void:
	interakcja.interact = Callable(self, "_on_interact")
	if boza_wiadomosc:
		boza_wiadomosc.visible = !boza_wiadomosc.visible
		
		
func _on_interact():
	boza_wiadomosc.visible = !boza_wiadomosc.visible
	print("Działa")
