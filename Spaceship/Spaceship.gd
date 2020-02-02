extends Area2D

var engine := false
var haul := false
var wing := false
var canopy := false
var trophy = preload("res://Scenes/Trophy.tscn")

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
						$RepairSound.play()
						$Particles2D.emitting = true
					
				"res://Spaceship/asset/Engine_Icon.png":
					if engine == false:	
						engine = true
						$Sprite/Engine_Fixed.visible = true
						body.item_picked_up = null
						$RepairSound.play()
						$Particles2D.emitting = true

				"res://Spaceship/asset/Haul_Icon.png":
					if haul == false:	
						haul = true
						$Sprite/Haul_Fixed.visible = true
						body.item_picked_up = null
						$RepairSound.play()
						$Particles2D.emitting = true
					
				"res://Spaceship/asset/SS_Wing.png":
					if wing == false:	
						wing = true
						$Sprite/SS_Wing.visible = true
						body.item_picked_up = null
						$RepairSound.play()
						$Particles2D.emitting = true
						
	if (haul && wing && engine && canopy) == true:
		print("Winner")
		$Sprite.visible = false
		$SS_FIXED.visible = true
		$Confetti.emitting = true
		
		var object = trophy.instance()
		object.winner = ship
		object.position = Vector2(512,300)
		get_tree().get_root().add_child(object)
		
		
