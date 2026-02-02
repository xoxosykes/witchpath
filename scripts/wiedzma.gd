extends CharacterBody2D

class_name Wiedzma

# --- USTAWIENIA ---
@export var SPEED = 210.0
@export var JUMP_VELOCITY = -600.0
@export var SWIM_JUMP : float = -250.0
@export var SWIM_GRAVITY : float = 0.25
@export var SWIM_VELOCITY_CAP : float = 100.0

# --- REFERENCJE ---
@onready var score_label = %wynik
@onready var CoyoteTimer: Timer = $CoyoteTimer
@onready var sprite = $animacja

# --- STANY ---
var in_water : bool = false
var is_playing_magic_anim : bool = false

func _ready():
	GameController.current_player = self
	update_ui(GameController.total_points)

func _physics_process(delta: float) -> void:
	var was_on_floor = is_on_floor()

	# GRAWITACJA
	if not is_on_floor():
		if not in_water:
			velocity += get_gravity() * delta
		else:
			velocity.y = clamp(velocity.y + (get_gravity().y * delta * SWIM_GRAVITY), -10000, SWIM_VELOCITY_CAP)

	# SKOK
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor() or not CoyoteTimer.is_stopped():
			velocity.y = JUMP_VELOCITY
			CoyoteTimer.stop() 

	# RUCH
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		sprite.flip_h = (direction < 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# OBSŁUGA ANIMACJI
	handle_animations(direction)

	move_and_slide()
	
	if was_on_floor and not is_on_floor() and velocity.y >= 0:
		CoyoteTimer.start()

func handle_animations(direction):
	# Blokada: jeśli machamy magią, nie zmieniaj animacji na ruch
	if is_playing_magic_anim:
		return 

	if direction != 0:
		if is_on_floor() and sprite.animation != "levitatin":
			sprite.play("levitatin")
	else:
		if is_on_floor() and sprite.animation != "idle":
			sprite.play("idle")

func _input(event):
	# Magic Sense (F) - teraz gra 2x
	if event.is_action_pressed("toggle_magic_sense"):
		play_magic_twice()

	# Interakcja (E) - teraz gra 2x
	if event.is_action_pressed("interact"):
		interact_with_closest()
		play_magic_twice()

# --- TA FUNKCJA ROBI CAŁĄ MAGIĘ (2 RAZY) ---
func play_magic_twice():
	# Jeśli już macha, nie pozwól odpalić jeszcze raz (anty-spam)
	if is_playing_magic_anim:
		return
		
	is_playing_magic_anim = true
	
	sprite.play("magic")
	await sprite.animation_finished # Pierwszy raz
	
	sprite.play("magic")
	await sprite.animation_finished # Drugi raz
	
	is_playing_magic_anim = false
	
	# Powrót do normy
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		sprite.play("levitatin")
	else:
		sprite.play("idle")

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

func _on_wykrywanie_wody_water_state_changed(new_in_water: bool) -> void:
	self.in_water = new_in_water

func update_ui(new_score: int):
	if score_label:
		score_label.text = ":" + str(new_score)
