extends Area2D




func _on_body_entered(body: CharacterBody2D):
	if body is Wiedzma:
		var parent = self.get_parent()
		if parent:
			parent.modulate.a = 0.1
	


func _on_body_exited(body: CharacterBody2D):
	if body is Wiedzma:
		var parent = self.get_parent()
		if parent:
			parent.modulate.a = 1
