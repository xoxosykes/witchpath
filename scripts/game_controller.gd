extends Node

#wersja Oli idk
#var total_coins: int = 0

#func coin_collected(value: int):
	#total_coins += value
	#EventController.emit_signal("coin_collected", total_coins )
	#GameController



var current_player: Wiedzma = null #sterowanie labelem wiedzmy
var total_points: int = 0

func reset_score():
	total_points = 0
	update_player_ui()

func coin_collected(amount: int):
	total_points += amount
	
	if has_node("/root/EventController"):
		EventController.emit_signal("coin_collected", total_points)
	update_player_ui()

func update_player_ui():
	if current_player:
		current_player.update_ui(total_points)
