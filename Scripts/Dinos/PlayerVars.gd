extends Node 

const _sprites = ["res://Assets/Ressources/Dinos/BlueAnimation.tres",
				  "res://Assets/Ressources/Dinos/GreenAnimation.tres",
				  "res://Assets/Ressources/Dinos/RedAnimation.tres",
				  "res://Assets/Ressources/Dinos/YellowAnimation.tres"]

const _icons = ["res://Assets/Ressources/Dinos/Blue.tres",
				"res://Assets/Ressources/Dinos/Green.tres",
				"res://Assets/Ressources/Dinos/Red.tres",
				"res://Assets/Ressources/Dinos/Yellow.tres"]

var p1Index : int = 0
var p2Index : int = 2

var p1Sprite : String = _sprites[0]
var p2Sprite : String = _sprites[2]

var p1Icon : String = _icons[0]
var p2Icon : String = _icons[2]

const _albino = "res://Assets/Ressources/Dinos/AlbinoAnimation.tres"


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
	
