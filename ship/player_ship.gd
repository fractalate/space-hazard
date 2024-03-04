extends Node2D

# pixels per second per second
const THRUST_ACCELERATION = 300

@onready var Ship = $RigidBody2D
@onready var RearThrusterFlame = $RigidBody2D/RearThruster/Flame
@onready var FrontThrusterFlame = $RigidBody2D/FrontThruster/Flame
@onready var TopThruster1Flame = $RigidBody2D/TopThruster1/Flame
@onready var TopThruster2Flame = $RigidBody2D/TopThruster2/Flame
@onready var BottomThrusterFlame = $RigidBody2D/BottomThruster/Flame

func _ready():
	RearThrusterFlame.visible = false
	FrontThrusterFlame.visible = false
	TopThruster1Flame.visible = false
	TopThruster2Flame.visible = false
	BottomThrusterFlame.visible = false

func _physics_process(delta):
	var thrust = Input.get_vector('left', 'right', 'up', 'down')
	Ship.linear_velocity += thrust * THRUST_ACCELERATION * delta

	FrontThrusterFlame.visible = thrust.x < 0
	RearThrusterFlame.visible = thrust.x > 0
	TopThruster1Flame.visible = thrust.y > 0
	TopThruster2Flame.visible = thrust.y > 0
	BottomThrusterFlame.visible = thrust.y < 0
