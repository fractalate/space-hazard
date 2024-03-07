extends Node2D

@onready var MainMenu = $MainMenu

var LevelDemo = load('res://levels/demo/level_demo.tscn')
var PlayerShip = load('res://ship/player_ship.tscn')

func start_level_demo():
	add_child(LevelDemo.instantiate())
	var playerShip = PlayerShip.instantiate()
	playerShip.position = get_viewport_rect().size / 2
	add_child(playerShip)

func _ready():
	MainMenu.select_default_button()
