extends Label


func _ready():
	text = "score: 0"
	EventController.connect("coin_collected",_on_coin_collected)

func _on_coin_collected(total_coins):
	text = "score: " + str(total_coins)
