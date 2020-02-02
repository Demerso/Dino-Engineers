extends Area2D

var engine := false
var haul := false
var wing := false
var canopy := false

export var ship: int

func _on_Area2D_body_entered(body):
	if body.filename == "res://Characters/Dino.tscn" && body.name == "Dino" + str(ship):
		if body.item_picked_up != null:
			match body.item_picked_up:
				"res://Spaceship/asset/Canopy_Icon.png":
					if canopy == false:
						canopy = true
						$Sprite/Canopy_Fixed.visible = true
						body.item_picked_up = null
					
				"res://Spaceship/asset/Engine_Icon.png":
					if engine == false:	
						engine = true
						$Sprite/Engine_Fixed.visible = true
						body.item_picked_up = null

				"res://Spaceship/asset/Haul_Icon.png":
					if haul == false:	
						haul = true
						$Sprite/Haul_Fixed.visible = true
						body.item_picked_up = null
					
				"res://Spaceship/asset/SS_Wing.png":
					if wing == false:	
						wing = true
						$Sprite/SS_Wing.visible = true
						body.item_picked_up = null
	if (haul && wing && engine && canopy) == true:
		print("Winner")
		$Sprite.visible = false;
		$SS_FIXED.visible = true;
		body.position = position
