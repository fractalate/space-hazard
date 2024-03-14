extends Node2D

var Rock = load('res://hazards/rock.tscn')

var viewport_width_initial = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height_initial = ProjectSettings.get_setting("display/window/size/viewport_height")

func _ready():
	$AnimationPlayer.play('level_panning')

func spawn_rock():
	var vp = Vector2(viewport_width_initial, viewport_height_initial)
	var rock = Rock.instantiate()
	# TODO: Spawn on top, bottom, left, or right edges instead of just right.
	rock.linear_velocity = Vector2(-randi_range(300, 600), 0).rotated(randf_range(deg_to_rad(-10), deg_to_rad(10)))
	rock.position = Vector2(vp.x - 1, randi_range(0, vp.y - 1))
	add_child(rock)
