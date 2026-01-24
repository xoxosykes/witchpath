extends Node2D  # albo Sprite2D, jak masz w scenie

@onready var highlight = $flower/highlight
var pulse_time: float = 0.0
var pulse_speed: float = 5.0
var alpha: float = 0.0
var fade_speed: float = 0.8  # jak szybko wygasa highlight

func _ready():
	# dodanie do grup
	add_to_group("glowing")       # świecące obiekty
	add_to_group("interactable")  # obiekty możliwe do interakcji

	if highlight:
		highlight.visible = true  # musi być widoczny, inaczej nie da się fade
		highlight.modulate.a = 0.0
		alpha = 0.0

func toggle_magic_sense(on: bool):
	# startujemy pulsację
	if on:
		highlight.visible = true

func _process(delta):
	if Input.is_action_pressed("toggle_magic_sense"):
		# kwiat pulsuje
		pulse_time += delta
		alpha = 0.3 + 0.7 * abs(sin(pulse_time * pulse_speed))
	else:
		# fade out
		alpha = lerp(alpha, 0.0, fade_speed * delta)
		if alpha < 0.01:
			alpha = 0.0
			pulse_time = 0.0

	if highlight:
		highlight.modulate.a = alpha
