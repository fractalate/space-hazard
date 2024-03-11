extends Control

signal menu_closed

@onready var ButtonTest = $ButtonTest
@onready var ButtonBack = $ButtonBack

# Called when the node enters the scene tree for the first time.
func _ready():
	ButtonBack.connect('pressed', on_button_back_pressed)
	ButtonTest.connect('pressed', on_button_test_pressed)

func select_default_button():
	ButtonBack.grab_focus()

func swap_fullscreen_mode():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

func on_button_test_pressed():
	swap_fullscreen_mode()

func on_button_back_pressed():
	menu_closed.emit()
	queue_free()
