extends RigidBody2D

var item = preload("res://Spaceship/Collectible/Item.tscn")

func _ready():
	randomize()
	angular_velocity = randf() * 50

func _process(delta):
	var bodies = get_colliding_bodies()
	if bodies.size() > 0:
		var object = item.instance()
		object.position = get_global_position()
		get_tree().get_root().add_child(object)
		queue_free()
