extends Node2D

var Rock = load('res://hazards/rock.tscn')
var rock_spawn_rate_min = 3
var rock_spawn_rate_max = 5
var time_before_rock_spawn = rand_time_before_rock_spawn()

var Dust = load('res://hazards/dust.tscn')
var dust_spawn_rate_min = .2
var dust_spawn_rate_max = .3
var time_before_dust_spawn = rand_time_before_dust_spawn()

var viewport_width_initial = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height_initial = ProjectSettings.get_setting("display/window/size/viewport_height")

func rand_time_before_rock_spawn():
	return randf_range(1.0 / rock_spawn_rate_max, 1.0 / rock_spawn_rate_min)

func rand_time_before_dust_spawn():
	return randf_range(1.0 / dust_spawn_rate_max, 1.0 / dust_spawn_rate_min)

func spawn_rock():
	var vp = Vector2(viewport_width_initial, viewport_height_initial)
	var rock = Rock.instantiate()
	# TODO: Spawn on top, bottom, left, or right edges instead of just right.
	rock.linear_velocity = Vector2(-randi_range(300, 600), 0).rotated(randf_range(deg_to_rad(-10), deg_to_rad(10)))
	rock.position = Vector2(vp.x - 1, randi_range(0, vp.y - 1))
	add_child(rock)

func spawn_dust():
	var vp = Vector2(viewport_width_initial, viewport_height_initial)
	var rand_y = randi_range(0, vp.y - 1)
	for x in range(vp.x - 10, vp.x, 2):
		for y in range(0, vp.y, 2):
			if y < rand_y - 40 or y > rand_y + 40:
				var dust = Dust.instantiate()
				dust.linear_velocity = Vector2(-randi_range(490, 500), 0).rotated(randf_range(deg_to_rad(-1), deg_to_rad(1)))
				dust.position = Vector2(x, y)
				add_child(dust)

func _process(delta):
	time_before_rock_spawn -= delta
	while time_before_rock_spawn <= 0.0:
		spawn_rock()
		time_before_rock_spawn += rand_time_before_rock_spawn()

	time_before_dust_spawn -= delta
	while time_before_dust_spawn <= 0.0:
		spawn_dust()
		time_before_dust_spawn += rand_time_before_dust_spawn()
