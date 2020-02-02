extends Area2D

onready var size = $CollisionShape2D.shape.extents
var object = preload("res://Meteor/Meteor.tscn")

var positionInArea : Vector2 = Vector2()

func _on_Timer_timeout():
	randomize()
	positionInArea.x = (randf() * size.x * 2) - size.x
	var spawn = object.instance()
	spawn.rotation_degrees = randf() * 20 - 10
	spawn.position = positionInArea
	add_child(spawn)
