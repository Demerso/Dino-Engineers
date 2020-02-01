extends KinematicBody2D

onready var _sprite = $AnimatedSprite

onready var _albino = preload("res://Characters/AlbinoAnimation.tres")
onready var _blue = preload("res://Characters/BlueAnimation.tres")
onready var _green = preload("res://Characters/GreenAnimation.tres")
onready var _red = preload("res://Characters/RedAnimation.tres")
onready var _yellow = preload("res://Characters/YellowAnimation.tres")

var konami_code = 0

var kicking = false
var hurt = false

func _ready():
	_sprite.set_sprite_frames(_blue)

func _process(delta):
	if (!kicking && !hurt):
		if Input.is_action_pressed("ui_left"):
			_sprite.set_flip_h(true)
			if Input.is_action_pressed("ui_down"):
				_sprite.play("Crouch")
			else:
				_sprite.play("Move")
		elif Input.is_action_pressed("ui_right"):
			_sprite.set_flip_h(false)
			if Input.is_action_pressed("ui_down"):
				_sprite.play("Crouch")
			else:
				_sprite.play("Move")
		elif Input.is_action_pressed("ui_down"):
			_sprite.play("CIdle")
		else:
			_sprite.play("Idle")
		
	if Input.is_action_just_pressed("ui_accept"):
		kicking = true
		_sprite.play("Kick")
		
	if Input.is_action_just_pressed("ui_cancel"):
		hurt = true
		_sprite.play("Hurt")


func _on_AnimatedSprite_animation_finished():
	if kicking: kicking = false
	if hurt: hurt = false
	
func _input(event):
	match konami_code:
		0: 
			if event.is_action_pressed("ui_up"): konami_code += 1
			else: konami_code = 0
		1: 
			if event.is_action_released("ui_up"): konami_code += 1
			else: konami_code = 0
		2: 
			if event.is_action_pressed("ui_up"): konami_code += 1
			else: konami_code = 0
		3: 
			if event.is_action_released("ui_up"): konami_code += 1
			else: konami_code = 0
		4:
			if event.is_action_pressed("ui_down"): konami_code += 1
			else: konami_code = 0
		5:
			if event.is_action_released("ui_down"): konami_code += 1
			else: konami_code = 0
		6:
			if event.is_action_pressed("ui_down"): konami_code += 1
			else: konami_code = 0
		7:
			if event.is_action_released("ui_down"): konami_code += 1
			else: konami_code = 0
		8:
			if event.is_action_pressed("ui_left"): konami_code += 1
			else: konami_code = 0
		9:
			if event.is_action_released("ui_left"): konami_code += 1
			else: konami_code = 0
		10:
			if event.is_action_pressed("ui_right"): konami_code += 1
			else: konami_code = 0
		11:
			if event.is_action_released("ui_right"): konami_code += 1
			else: konami_code = 0
		12:
			if event.is_action_pressed("ui_left"): konami_code += 1
			else: konami_code = 0
		13:
			if event.is_action_released("ui_left"): konami_code += 1
			else: konami_code = 0
		14:
			if event.is_action_pressed("ui_right"): konami_code += 1
			else: konami_code = 0
		15:
			if event.is_action_released("ui_right"): konami_code += 1
			else: konami_code = 0
		16:
			if event.is_action_pressed("ui_accept"): konami_code += 1
			else: konami_code = 0
		16:
			if event.is_action_released("ui_accept"): konami_code += 1
			else: konami_code = 0
		17:
			if _sprite.get_sprite_frames() != _albino:
				_sprite.set_sprite_frames(_albino)
