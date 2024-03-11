extends Node2D

@onready var MainMenu = $MainMenu
@onready var Background = $Background

var LevelDemo = load('res://levels/demo/level_demo.tscn')
var PlayerShip = load('res://ship/player_ship.tscn')

var viewport_width_initial = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height_initial = ProjectSettings.get_setting("display/window/size/viewport_height")

func start_level_demo():
	add_child(LevelDemo.instantiate())
	var playerShip = PlayerShip.instantiate()
	playerShip.position = Vector2(viewport_width_initial, viewport_height_initial) / 2
	add_child(playerShip)

func set_main_menu_visible(visible: bool):
	MainMenu.visible = visible
	Background.visible = visible

func _ready():
	MainMenu.select_default_button()
	var on_menu_closed = func():
		set_main_menu_visible(false)
	var on_start_marathon = func():
		start_level_demo()
	MainMenu.connect('menu_closed', on_menu_closed)
	MainMenu.connect('start_marathon', on_start_marathon)
