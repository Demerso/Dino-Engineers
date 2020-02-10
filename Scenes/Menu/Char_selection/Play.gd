extends Control

var soundPlaying = false

const _title_screen : String = "res://Scenes/Menu/Title_screen/Title_screen.tscn"
const _map1: String = "res://Scenes/Worlds/Map1.tscn"

onready var _p1Rdy = $Selection/Main/Player1/RdyContainer/P1rdy
onready var _p2Rdy = $Selection/Main/Player2/RdyContainer/P2rdy

onready var _p1Sprt = $Selection/Main/Player1/Dino
onready var _p2Sprt = $Selection/Main/Player2/Dino

func _on_Back_Button_pressed():
	print("oui")
# warning-ignore:return_value_discarded
	get_tree().change_scene(_title_screen)

func _ready():
	PlayerVars.p1Index = 0
	PlayerVars.p2Index = 2
	_p1Sprt.set_texture(load(PlayerVars.p1Icon))
	_p2Sprt.set_texture(load(PlayerVars.p2Icon))

func _input(event):
	if event.is_action_pressed("kick1"):
		$ButtonPress.play()
		_p1Rdy.pressed = !_p1Rdy.pressed
		checkRdy()
	if event.is_action_pressed("kick2"):
		$ButtonPress.play()
		_p2Rdy.pressed = !_p2Rdy.pressed
		checkRdy()
	if event.is_action_pressed("left1"):
		$ButtonPress.play()
		PlayerVars.prevSprite(1)
	if(event.is_action_pressed("left2")):
		$ButtonPress.play()
		PlayerVars.prevSprite(2)
	if(event.is_action_pressed("right1")):
		$ButtonPress.play()
		PlayerVars.nextSprite(1)
	if(event.is_action_pressed("right2")):
		$ButtonPress.play()
		PlayerVars.nextSprite(2)
	_p1Sprt.set_texture(load(PlayerVars.p1Icon))
	_p2Sprt.set_texture(load(PlayerVars.p2Icon))

func checkRdy():
	if _p1Rdy.pressed && _p2Rdy.pressed:
		get_tree().change_scene(_map1)

func _on_P2rdy_button_down():
	$ButtonPress.play()
	checkRdy()


func _on_P1rdy_button_down():
	$ButtonPress.play()
	checkRdy()
