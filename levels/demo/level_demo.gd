extends Node2D

var Rock = load('res://hazards/rock.tscn')
var rock_spawn_rate_min = 3
var rock_spawn_rate_max = 5
var time_before_rock_spawn = rand_time_before_rock_spawn()

func rand_time_before_rock_spawn():
	return randf_range(1.0 / rock_spawn_rate_max, 1.0 / rock_spawn_rate_min)

func spawn_rock():
	var vp = get_viewport_rect()
	var rock = Rock.instantiate()
	# TODO: Spawn on top, bottom, left, or right edges instead of just right.
	rock.linear_velocity = Vector2(-randi_range(300, 600), 0).rotated(randf_range(deg_to_rad(-10), deg_to_rad(10)))
	rock.position = Vector2(vp.size.x - 1, randi_range(0, vp.size.y - 1))
	add_child(rock)

func _process(delta):
	time_before_rock_spawn -= delta
	while time_before_rock_spawn <= 0.0:
		spawn_rock()
		time_before_rock_spawn += rand_time_before_rock_spawn()
