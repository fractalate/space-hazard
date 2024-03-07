extends Control

@onready var ButtonNewGame = $ButtonNewGame

func select_default_button():
	ButtonNewGame.grab_focus()
