extends Node2D

# pixels per second per second
const THRUST_ACCELERATION = 300

@onready var Ship = $RigidBody2D
@onready var RearThrusterFlame = $RigidBody2D/RearThruster/Flame
@onready var FrontThrusterFlame = $RigidBody2D/FrontThruster/Flame
@onready var TopThruster1Flame = $RigidBody2D/TopThruster1/Flame
@onready var TopThruster2Flame = $RigidBody2D/TopThruster2/Flame
@onready var BottomThrusterFlame = $RigidBody2D/BottomThruster/Flame
@onready var BottomLightLight = $RigidBody2D/BottomLight/Light

const BOTTOM_LIGHT_CYCLE_TIME: float = 2.0
var bottom_light_time_passed: float = 0.0

func _ready():
	RearThrusterFlame.visible = false
	FrontThrusterFlame.visible = false
	TopThruster1Flame.visible = false
	TopThruster2Flame.visible = false
	BottomThrusterFlame.visible = false
	BottomLightLight.visible = false

func _physics_process(delta):
	var thrust = Input.get_vector('left', 'right', 'up', 'down')
	Ship.linear_velocity += thrust * THRUST_ACCELERATION * delta

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
