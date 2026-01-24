extends CharacterBody2D

class_name Wiedzma
const SPEED = 210.0
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
#interakcja pod E	
func _process(delta) -> void:
	if Input.is_action_just_pressed("interact"):
		interact_with_closest()

func interact_with_closest():
	var closest = null
	var min_d = 50

	for obj in get_tree().get_nodes_in_group("interactable"):
		var d = global_position.distance_to(obj.global_position)
		if d < min_d:
			closest = obj
			min_d = d

	if closest and closest.has_method("interact"):
		closest.interact()
	
