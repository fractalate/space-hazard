extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation = 0 # Don't rotate.

	move_and_collide(linear_velocity * delta)
