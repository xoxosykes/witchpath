extends Node2D

@export var value: int = 1
@onready var score_label = %wynik  


func _on_area_zbierania_body_entered(body: Node2D) -> void:
	if body is Wiedzma:
		GameController.coin_collected(value)
		self.queue_free()
