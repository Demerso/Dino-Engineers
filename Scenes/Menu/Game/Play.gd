extends Control

func _on_Back_Button_pressed():
	get_tree().change_scene("res://Title_screen.tscn")
func _on_P1rdy_pressed():
	if ($P1rdy2.pressed):
		pass#LOAD MAIN GAME SCENE

func _on_P1rdy2_pressed():
	if ($P1rdy.pressed):
		pass#LOAD MAIN GAME SCENE

func _input(event):
	if(event.is_action_pressed("left1")):
		#cycle left sprite + value of p1 
		if($PanelContainer/P1Sprite.get_animation() == "Blue Idle"):
			$PanelContainer/P1Sprite.set_animation("Green Idle")
		elif($PanelContainer/P1Sprite.get_animation() == "Red Idle"):
			$PanelContainer/P1Sprite.set_animation("Yellow Idle")
		elif($PanelContainer/P1Sprite.get_animation() == "Yellow Idle"):
			$PanelContainer/P1Sprite.set_animation("Blue Idle")
		elif($PanelContainer/P1Sprite.get_animation() == "Green Idle"):
			$PanelContainer/P1Sprite.set_animation("Red Idle")
	if(event.is_action_pressed("left2")):
		#cycle left sprite + value of p2
		if($PanelContainer2/P2Sprite.get_animation() == "Blue Idle"):
			$PanelContainer2/P2Sprite.set_animation("Green Idle")
		elif($PanelContainer2/P2Sprite.get_animation() == "Red Idle"):
			$PanelContainer2/P2Sprite.set_animation("Yellow Idle")
		elif($PanelContainer2/P2Sprite.get_animation() == "Yellow Idle"):
			$PanelContainer2/P2Sprite.set_animation("Blue Idle")
		elif($PanelContainer2/P2Sprite.get_animation() == "Green Idle"):
			$PanelContainer2/P2Sprite.set_animation("Red Idle")
	if(event.is_action_pressed("right1")):
		#cycle right sprite + value of p1 
		if($PanelContainer/P1Sprite.get_animation() == "Blue Idle"):
			$PanelContainer/P1Sprite.set_animation("Yellow Idle")
		elif($PanelContainer/P1Sprite.get_animation() == "Red Idle"):
			$PanelContainer/P1Sprite.set_animation("Green Idle")
		elif($PanelContainer/P1Sprite.get_animation() == "Yellow Idle"):
			$PanelContainer/P1Sprite.set_animation("Red Idle")
		elif($PanelContainer/P1Sprite.get_animation() == "Green Idle"):
			$PanelContainer/P1Sprite.set_animation("Blue Idle")
	if(event.is_action_pressed("right2")): 
		#cycle right sprite + value of p2
		if($PanelContainer2/P2Sprite.get_animation() == "Blue Idle"):
			$PanelContainer2/P2Sprite.set_animation("Yellow Idle")
		elif($PanelContainer2/P2Sprite.get_animation() == "Red Idle"):
			$PanelContainer2/P2Sprite.set_animation("Green Idle")
		elif($PanelContainer2/P2Sprite.get_animation() == "Yellow Idle"):
			$PanelContainer2/P2Sprite.set_animation("Red Idle")
		elif($PanelContainer2/P2Sprite.get_animation() == "Green Idle"):
			$PanelContainer2/P2Sprite.set_animation("Blue Idle")
