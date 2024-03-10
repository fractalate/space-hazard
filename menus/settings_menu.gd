extends Control

signal menu_closed

@onready var ButtonBack = $ButtonBack

# Called when the node enters the scene tree for the first time.
func _ready():
	ButtonBack.connect('pressed', on_button_back_pressed)

func select_default_button():
	ButtonBack.grab_focus()

func on_button_back_pressed():
	menu_closed.emit()
	queue_free()
