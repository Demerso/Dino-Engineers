extends Area2D

var bodies= null
var picked = false
onready var _sprite = $Sprite
var translation = Vector2()
export var mov_spd = 0.3

onready var pickupSound = $sFxItem/PickupSound

onready var items = ["res://Spaceship/asset/Canopy_Icon.png",
					 "res://Spaceship/asset/Engine_Icon.png",
					 "res://Spaceship/asset/Haul_Icon.png",
					 "res://Spaceship/asset/SS_Wing.png"]
					
var item

func _ready():
	item = items[randi()%4]
	_sprite.set_texture(load(item))
	$Particles2D.emitting = true

func _process(delta):
	_sprite = translate(translation)
	if picked: hide()

func _on_Timer_timeout():
	if translation == Vector2(0, -mov_spd):
		translation = Vector2(0, mov_spd)
	else:
		translation = Vector2(0, -mov_spd)


func _on_Item_body_entered(body):
	if body.filename == "res://Characters/Dino.tscn" and picked == false:
		if body.item_picked_up == null:
			body.item_picked_up = item
			picked = true
			pickupSound.play()


func _on_PickupSound_finished():
	queue_free()
