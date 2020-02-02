extends Area2D

var engine := false
var haul := false
var wing := false
var canopy := false

export var ship: int

func _on_Area2D_body_entered(body):
	if body.filename == "res://Characters/Dino.tscn" && body.name == "Dino" + str(ship):
		if body.item_picked_up != null:
			print(body.item_picked_up)
			match body.item_picked_up:
				"res://Spaceship/asset/Canopy_Icon.png":
					canopy = true
					$Sprite/Canopy_Fixed.visible = true
					body.item_picked_up = null
					
				"res://Spaceship/asset/Engine_Icon.png":
					engine = true
					$Sprite/Engine_Fixed.visible = true
					body.item_picked_up = null

				"res://Spaceship/asset/Haul_Icon.png":
					haul = true
					$Sprite/Haul_Fixed.visible = true
					body.item_picked_up = null
					
				"res://Spaceship/asset/SS_Wing.png":
					wing = true
					$Sprite/SS_Wing.visible = true
					body.item_picked_up = null
