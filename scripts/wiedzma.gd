extends CharacterBody2D

class_name Wiedzma
@export var SPEED = 210.0
@export var JUMP_VELOCITY = -600.0
@export var SWIM_JUMP : float = -250.0 #pływanie w góre/skakanie w wodzie
@export var SWIM_GRAVITY : float = 0.25 # Spowolnienie postaci, która pływa
@export var SWIM_VELOCITY_CAP : float = 100.0 # Limit prędkości pływania

var in_water : bool = false

func _physics_process(delta: float) -> void:
	# Grawitacja
	if not is_on_floor():
		if(!in_water):
			velocity += get_gravity() * delta
		else:
			velocity.y = clamp(velocity.y + (get_gravity().y * delta * SWIM_GRAVITY), -10000, SWIM_VELOCITY_CAP)

	# Skok
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		if in_water == true:
			velocity.y = SWIM_JUMP
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
#interakcja pod E	
func _process(delta):
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
	

#pływanie postaci
func _on_wykrywanie_wody_water_state_changed(in_water: bool) -> void:
	self.in_water = in_water
	print(in_water)
