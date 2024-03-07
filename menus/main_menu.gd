extends Control

#@onready var ButtonNewGame = $ButtonNewGame
@onready var ButtonMarathon = $ButtonMarathon

func select_default_button():
	ButtonMarathon.grab_focus()
