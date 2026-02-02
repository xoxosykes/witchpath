extends Node2D

# co może wchodzić w interakcje (gracz)
@onready var player = get_tree().get_first_node_in_group("Wiedzma")
@onready var label = $Interakcja_label

# etykietka z interakcją
const base_text = "[E]"

# działanie area2D, oraz ilość area2D z którymi można wejść w interakcje
var active_areas = []
var can_interact = true

# rejestruje interakcje, jak gracz wejdzie do wyznaczonego obszru
func register_area(area: Interakcja):
	active_areas.push_back(area)

# wyrejestrowuje interakcje, jak gracz opuści wyznaczony obszar
func unregister_area(area: Interakcja):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)


# jeśli więcej niż jedna interakcja obok siebie, aktywuje sie ta bliżej gracza 
# żeby to pokazać wyświetli się label lub zniknie
func _process(delta):
	if active_areas.size() > 0 && can_interact:
		active_areas.sort_custom(_sort_by_distance_to_player)
		label.text = base_text + active_areas[0].action_name
		label.global_position = active_areas[0].global_position
		label.global_position.y -= 36
		label.global_position.x -= label.size.x / 2
		label.show()
	else:
		label.hide()
	

# sprawdza który obszar jest bliżej gracza
func _sort_by_distance_to_player(area1, area2):
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player

# interakcja z graczem (sprawdza czy gracz może wejśc w interakcje)
func _input(event):
	if event.is_action_pressed("interact") && can_interact:
		if active_areas.size() > 0:
			can_interact = false
			label.hide()
			
			await active_areas[0].interact.call()
			
			can_interact = true
