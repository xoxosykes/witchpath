extends Area2D
class_name Interakcja


@export var action_name : String = "interact"

var interact: Callable = func(_on_interact):
	pass


func _on_body_entered(body: Node2D) -> void:
	InterakcjaManager.register_area(self)


func _on_body_exited(body: Node2D) -> void:
	InterakcjaManager.unregister_area(self)
