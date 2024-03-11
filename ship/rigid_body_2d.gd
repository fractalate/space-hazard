extends RigidBody2D

# pixels per second per second
const THRUST_ACCELERATION = 300

var t0 = Time.get_ticks_usec()
var t1 = Time.get_ticks_usec()

func _integrate_forces(state):
	var thrust = Input.get_vector('left', 'right', 'up', 'down')
	t1 = Time.get_ticks_usec()
	var delta = (t1 - t0) / 1e6
	t0 = t1
	linear_velocity += thrust * THRUST_ACCELERATION * delta

func _physics_process(delta):
	rotation = 0 # Don't rotate.

	move_and_collide(linear_velocity * delta)
