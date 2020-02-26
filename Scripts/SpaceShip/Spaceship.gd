extends Area2D

const DINO_SCENE = "res://Scenes/Dinos/Dino.tscn"
const CANOPY_ICON = "res://Assets/Sprites/SpaceShip/Canopy_Icon.png"
const ENGINE_ICON = "res://Assets/Sprites/SpaceShip/Engine_Icon.png"
const HAUL_ICON = "res://Assets/Sprites/SpaceShip/Haul_Icon.png"
const WINGS_ICON = "res://Assets/Sprites/SpaceShip/SS_Wing.png"

var engine := false
var haul := false
var wing := false
var canopy := false
var trophy = preload("res://Scenes/Trophy/Trophy.tscn")

export var ship: int

func _on_Area2D_body_entered(body):
	if body.filename == DINO_SCENE && body.name == "Dino" + str(ship):
		if body.item_picked_up != null:
			match body.item_picked_up:
				CANOPY_ICON:
					if canopy == false:
						canopy = true
						$Sprite/Canopy_Fixed.visible = true
						body.item_picked_up = null
						$RepairSound.play()
						$Particles2D.emitting = true
					
				ENGINE_ICON:
					if engine == false:	
						engine = true
						$Sprite/Engine_Fixed.visible = true
						body.item_picked_up = null
						$RepairSound.play()
						$Particles2D.emitting = true

				HAUL_ICON:
					if haul == false:	
						haul = true
						$Sprite/Haul_Fixed.visible = true
						body.item_picked_up = null
						$RepairSound.play()
						$Particles2D.emitting = true
					
				WINGS_ICON:
					if wing == false:	
						wing = true
						$Sprite/SS_Wing.visible = true
						body.item_picked_up = null
						$RepairSound.play()
						$Particles2D.emitting = true
						
	if (haul && wing && engine && canopy) == true:
		$Sprite.visible = false
		$SS_FIXED.visible = true
		$Confetti.emitting = true
		
		var object = trophy.instance()
		object.winner = ship
		object.position = Vector2(512,300)
		get_tree().get_current_scene().add_child(object)
		
		
