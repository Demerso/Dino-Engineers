extends Node 

const _sprites = ["res://Characters/BlueAnimation.tres",
				  "res://Characters/GreenAnimation.tres",
				  "res://Characters/RedAnimation.tres",
				  "res://Characters/YellowAnimation.tres"]

const _icons = ["res://Scenes/Menu/DinoTextures/Blue/Blue.tres",
				"res://Scenes/Menu/DinoTextures/Green/Green.tres",
				"res://Scenes/Menu/DinoTextures/Red/Red.tres",
				"res://Scenes/Menu/DinoTextures/Yellow/Yellow.tres"]

var p1Index : int = 0
var p2Index : int = 2

var p1Sprite : String = "res://Characters/BlueAnimation.tres"
var p2Sprite : String = "res://Characters/RedAnimation.tres"

var p1Icon : String = "res://Scenes/Menu/DinoTextures/Blue/Blue.tres"
var p2Icon : String = "res://Scenes/Menu/DinoTextures/Red/Red.tres"

const _albino = "res://Characters/AlbinoAnimation.tres"


func nextSprite(player : int):
	var newIndex = p1Index if player == 1 else p2Index
	newIndex = (newIndex+1)%_sprites.size()
	if player == 1:
		p1Index = newIndex
	else:
		p2Index = newIndex
	updateSprites()
	
	
func prevSprite(player : int):
	var newIndex = p1Index if player == 1 else p2Index
	newIndex = (newIndex-1+_sprites.size())%_sprites.size()
	if player == 1:
		p1Index = newIndex
	else:
		p2Index = newIndex
	updateSprites()

func updateSprites():
	p1Sprite = _sprites[p1Index]
	p2Sprite = _sprites[p2Index]
	p1Icon = _icons[p1Index]
	p2Icon = _icons[p2Index]
	
