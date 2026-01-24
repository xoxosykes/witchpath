extends Node2D

var player_near = false
var active = false  # kwiatek aktywny?

@onready var mask = $pivot/mask
@onready var collision = $pivot/collision
@onready var detector = $pivot/detector
@onready var anim = $AnimationPlayer

func _ready():
	# Początkowo kwiatek niewidoczny, kolizja wyłączona
	mask.visible = false
	collision.disabled = true
	
	# (opcjonalnie) jak chcesz żeby był totalnie schowany:
	# mask.size.y = 0
	# mask.position.y = 0

	# Podłącz sygnały detectora
	detector.body_entered.connect(Callable(self, "_on_body_entered"))
	detector.body_exited.connect(Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body is Wiedzma:
		player_near = true

func _on_body_exited(body):
	if body is Wiedzma:
		player_near = false
		if active:
			anim.play_backwards("grow")
			active = false

func _process(delta):
	if player_near and Input.is_action_just_pressed("interact"):  # E
		if not active:
			# Pokazujemy kwiat + aktywujemy kolizję
			mask.visible = true
			collision.disabled = false

		anim.play("grow")
		active = true
