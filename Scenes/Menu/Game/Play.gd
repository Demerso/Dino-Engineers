extends Control

var soundPlaying = false

var _albino = "res://Characters/AlbinoAnimation.tres"
var _blue = "res://Characters/BlueAnimation.tres"
var _green = "res://Characters/GreenAnimation.tres"
var _red = "res://Characters/RedAnimation.tres"
var _yellow = "res://Characters/YellowAnimation.tres"

func _on_Back_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu/Title_screen.tscn")
func _on_P1rdy_pressed():
	if ($P1rdy2.pressed):
		$ButtonPress.play()
		get_tree().change_scene("res://Scenes/Worlds/Map1.tscn")

func _on_P1rdy2_pressed():
	if ($P1rdy.pressed):
		$ButtonPress.play()
		get_tree().change_scene("res://Scenes/Worlds/Map1.tscn")

func _ready():
	PlayerVars.p1Sprite = _blue
	PlayerVars.p2Sprite = _red

func _input(event):
	if event.is_action_pressed("kick1"):
		$ButtonPress.play()
		$P1rdy.pressed = !$P1rdy.pressed
		if $P1rdy.pressed: _on_P1rdy_pressed()
	if event.is_action_pressed("kick2"):
		$ButtonPress.play()
		$P1rdy2.pressed = !$P1rdy2.pressed
		if $P1rdy2.pressed: _on_P1rdy2_pressed()
	if(event.is_action_pressed("left1")):
		$ButtonPress.play()
		#cycle left sprite + value of p1 
		if($PanelContainer/P1Sprite.get_animation() == "Blue Idle"):
			$PanelContainer/P1Sprite.set_animation("Green Idle")
			PlayerVars.p1Sprite = _green
		elif($PanelContainer/P1Sprite.get_animation() == "Red Idle"):
			$PanelContainer/P1Sprite.set_animation("Yellow Idle")
			PlayerVars.p1Sprite = _yellow
		elif($PanelContainer/P1Sprite.get_animation() == "Yellow Idle"):
			$PanelContainer/P1Sprite.set_animation("Blue Idle")
			PlayerVars.p1Sprite = _blue
		elif($PanelContainer/P1Sprite.get_animation() == "Green Idle"):
			$PanelContainer/P1Sprite.set_animation("Red Idle")
			PlayerVars.p1Sprite = _red
	if(event.is_action_pressed("left2")):
		$ButtonPress.play()
		#cycle left sprite + value of p2
		if($PanelContainer2/P2Sprite.get_animation() == "Blue Idle"):
			$PanelContainer2/P2Sprite.set_animation("Green Idle")
			PlayerVars.p2Sprite = _green
		elif($PanelContainer2/P2Sprite.get_animation() == "Red Idle"):
			$PanelContainer2/P2Sprite.set_animation("Yellow Idle")
			PlayerVars.p2Sprite = _yellow
		elif($PanelContainer2/P2Sprite.get_animation() == "Yellow Idle"):
			$PanelContainer2/P2Sprite.set_animation("Blue Idle")
			PlayerVars.p2Sprite = _blue
		elif($PanelContainer2/P2Sprite.get_animation() == "Green Idle"):
			$PanelContainer2/P2Sprite.set_animation("Red Idle")
			PlayerVars.p2Sprite = _red
	if(event.is_action_pressed("right1")):
		$ButtonPress.play()
		#cycle right sprite + value of p1 
		if($PanelContainer/P1Sprite.get_animation() == "Blue Idle"):
			$PanelContainer/P1Sprite.set_animation("Yellow Idle")
			PlayerVars.p1Sprite = _yellow
		elif($PanelContainer/P1Sprite.get_animation() == "Red Idle"):
			$PanelContainer/P1Sprite.set_animation("Green Idle")
			PlayerVars.p1Sprite = _green
		elif($PanelContainer/P1Sprite.get_animation() == "Yellow Idle"):
			$PanelContainer/P1Sprite.set_animation("Red Idle")
			PlayerVars.p1Sprite = _red
		elif($PanelContainer/P1Sprite.get_animation() == "Green Idle"):
			$PanelContainer/P1Sprite.set_animation("Blue Idle")
			PlayerVars.p1Sprite = _blue
	if(event.is_action_pressed("right2")):
		$ButtonPress.play()
		#cycle right sprite + value of p2
		if($PanelContainer2/P2Sprite.get_animation() == "Blue Idle"):
			$PanelContainer2/P2Sprite.set_animation("Yellow Idle")
			PlayerVars.p2Sprite = _yellow
		elif($PanelContainer2/P2Sprite.get_animation() == "Red Idle"):
			$PanelContainer2/P2Sprite.set_animation("Green Idle")
			PlayerVars.p2Sprite = _green
		elif($PanelContainer2/P2Sprite.get_animation() == "Yellow Idle"):
			$PanelContainer2/P2Sprite.set_animation("Red Idle")
			PlayerVars.p2Sprite = _red
		elif($PanelContainer2/P2Sprite.get_animation() == "Green Idle"):
			$PanelContainer2/P2Sprite.set_animation("Blue Idle")
			PlayerVars.p2Sprite = _blue
