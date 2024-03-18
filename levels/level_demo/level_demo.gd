extends Node2D

var Rock = load('res://hazards/rock.tscn')
var Dust = load('res://hazards/dust.tscn')

var viewport_width_initial = ProjectSettings.get_setting("display/window/size/viewport_width")
var viewport_height_initial = ProjectSettings.get_setting("display/window/size/viewport_height")
var ship: PlayerShip = null

func _ready():
	$AnimationPlayer.play('level_panning')

func set_ship(new_ship: PlayerShip):
	ship = new_ship

func spawn_rock_at(position: Vector2, velocity: Vector2):
	var rock = Rock.instantiate()
	rock.linear_velocity = velocity
	rock.position = position
	add_child(rock)

func spawn_dust_at(position: Vector2, velocity: Vector2):
	var rock = Dust.instantiate()
	rock.linear_velocity = velocity
	rock.position = position
	add_child(rock)

func _process(delta):
	if Input.is_action_just_pressed('ui_accept'):
		var pos = ship.position + Vector2(25, 5)
		var vel = ship.linear_velocity + Vector2(200, 0)
		spawn_rock_at(pos, vel)

	#if Input.is_action_pressed('ui_accept'):
		#var pos = ship.position + Vector2(25, 5)
		#var vel = ship.linear_velocity + Vector2(200, 0)
		#spawn_dust_at(pos, vel)
