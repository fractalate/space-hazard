extends Control

signal menu_closed

var SettingsMenu = load('res://menus/settings_menu.tscn')

@onready var MainMenuContent = $MainMenuContent

#@onready var ButtonNewGame = $MainMenuContent/ButtonNewGame
@onready var ButtonMarathon = $MainMenuContent/ButtonMarathon
@onready var ButtonSettings = $MainMenuContent/ButtonSettings
@onready var ButtonExit = $MainMenuContent/ButtonExit

func _ready():
	ButtonMarathon.connect('pressed', on_button_marathon_pressed)
	ButtonSettings.connect('pressed', on_button_settings_pressed)
	ButtonExit.connect('pressed', on_button_exit_pressed)

func select_default_button():
	ButtonMarathon.grab_focus()

func on_button_marathon_pressed():
	print('starting marathon')

func on_button_settings_pressed():
	var m = SettingsMenu.instantiate()
	add_child(m)
	m.select_default_button()
	MainMenuContent.visible = false
	var on_back = func():
		MainMenuContent.visible = true
		ButtonSettings.grab_focus()
	m.connect('menu_closed', on_back)

func on_button_exit_pressed():
	menu_closed.emit()
	queue_free()
	# It might make sense to quit elsewhere, handling the menu_closed signal.
	# e.g. if you need to save something that the menu doesn't track first.
	# this is sufficient for now because we have nothing to save yet.
	get_tree().quit()
