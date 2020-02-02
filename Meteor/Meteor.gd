extends RigidBody2D

var item = preload("res://Spaceship/Collectible/Item.tscn")
var dead = false

func _ready():
	randomize()
	angular_velocity = randf() * 50

func _process(delta):
	var bodies = get_colliding_bodies()
	if bodies.size() > 0 && !dead:
		var object = item.instance()
		object.position = get_global_position()
		get_tree().get_root().add_child(object)
		$Sprite.hide()
		$Particles2D/Timer.start()
		dead = true
		$Whistle.stop()

func _on_Timer_timeout():
	queue_free()
