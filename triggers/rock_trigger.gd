extends Node2D

var Rock = load('res://hazards/rock.tscn')
@onready var InnerNode = $Node2D

func _ready():
	InnerNode.visible = false

func spawn_rock():
	var rock = Rock.instantiate()
	rock.linear_velocity = Vector2(
		-randi_range(300, 600),
		0
	).rotated(rotation)
	rock.linear_velocity
	add_child(rock)
	
