extends Node2D

# pixels per second per second
const THRUST_ACCELERATION = 300

@onready var Ship = $RigidBody2D



func _process(delta):
	var thrust = Input.get_vector('left', 'right', 'up', 'down')
	Ship.linear_velocity += thrust * THRUST_ACCELERATION * delta
