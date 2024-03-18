extends RigidBody2D

class_name PlayerShip

@onready var RearThrusterFlame = $RearThruster/Flame
@onready var FrontThrusterFlame = $FrontThruster/Flame
@onready var TopThruster1Flame = $TopThruster1/Flame
@onready var TopThruster2Flame = $TopThruster2/Flame
@onready var BottomThrusterFlame = $BottomThruster/Flame
@onready var BottomLightLight = $BottomLight/Light

# pixels per second per second
const THRUST_ACCELERATION = 300
const BOTTOM_LIGHT_CYCLE_TIME: float = 2.0

var bottom_light_time_passed: float = 0.0
var t0 = Time.get_ticks_usec()
var t1 = Time.get_ticks_usec()

func _ready():
	RearThrusterFlame.visible = false
	FrontThrusterFlame.visible = false
	TopThruster1Flame.visible = false
	TopThruster2Flame.visible = false
	BottomThrusterFlame.visible = false
	BottomLightLight.visible = false

func _process(delta):
	var thrust = Input.get_vector('left', 'right', 'up', 'down')

	FrontThrusterFlame.visible = thrust.x < 0
	RearThrusterFlame.visible = thrust.x > 0
	TopThruster1Flame.visible = thrust.y > 0
	TopThruster2Flame.visible = thrust.y > 0
	BottomThrusterFlame.visible = thrust.y < 0

	bottom_light_time_passed += delta
	while bottom_light_time_passed >= BOTTOM_LIGHT_CYCLE_TIME:
		bottom_light_time_passed -= BOTTOM_LIGHT_CYCLE_TIME
	BottomLightLight.visible = (
		bottom_light_time_passed >= .5 * BOTTOM_LIGHT_CYCLE_TIME and bottom_light_time_passed <= .6 * BOTTOM_LIGHT_CYCLE_TIME
		or
		bottom_light_time_passed >= .7 * BOTTOM_LIGHT_CYCLE_TIME and bottom_light_time_passed <= .8 * BOTTOM_LIGHT_CYCLE_TIME
	)

func _integrate_forces(state):
	var thrust = Input.get_vector('left', 'right', 'up', 'down')
	t1 = Time.get_ticks_usec()
	var delta = (t1 - t0) / 1e6
	t0 = t1
	linear_velocity += thrust * THRUST_ACCELERATION * delta

func _physics_process(delta):
	rotation = 0 # Don't rotate.

	move_and_collide(linear_velocity * delta)
