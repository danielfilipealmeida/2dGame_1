extends TileMap

onready var player = get_node("/root/Game/Player/Player")

var deathY = 384

func _process(_delta):
	if player.position.y > deathY:
		player.die()
