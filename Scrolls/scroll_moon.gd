extends Node2D

@onready var interakcja: Interakcja = $Scroll/Interakcja
@onready var scroll_wiadomosc: Panel = $Scroll_wiadomosc


var active = false 

func _ready() -> void:
	interakcja.interact = Callable(self, "_on_interact")
	if scroll_wiadomosc:
		scroll_wiadomosc.visible = !scroll_wiadomosc.visible
		
		
func _on_interact():
	scroll_wiadomosc.visible = !scroll_wiadomosc.visible
	print("Działa")
