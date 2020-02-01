extends RigidBody2D

func _ready():
	randomize()
	angular_velocity = randf() * 50

func _process(delta):
	var bodies = get_colliding_bodies()
	if bodies.size() > 0:
		queue_free()
