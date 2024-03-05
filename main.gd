extends Node2D

var LevelDemo = load('res://levels/demo/level_demo.tscn')
var PlayerShip = load('res://ship/player_ship.tscn')

func _ready():
	add_child(LevelDemo.instantiate())
	var playerShip = PlayerShip.instantiate()
	playerShip.position = get_viewport_rect().size / 2
	add_child(playerShip)
