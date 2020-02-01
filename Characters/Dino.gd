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

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 500
const ACCELERATION = 50
const JUMP_HEIGHT = -550
var nbjump = 1 #might increase it with item picked up
var motion = Vector2()
var directionx := 0


func _physics_process(delta: float) -> void:
	motion.y += GRAVITY
	var friction = false
	directionx = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	if directionx != 0:
		motion.x = clamp(motion.x+ACCELERATION*directionx,-MAX_SPEED,MAX_SPEED)
	else:
		motion.x = lerp(motion.x,0, 0.2)
		friction = true
	update_sprite(directionx)
	if is_on_floor():
		nbjump = 1
		if friction == true:
			motion.x = lerp(motion.x,0, 0.2)
	else:
		if friction == true:
			motion.x = lerp(motion.x,0, 0.05)
	if (Input.is_action_pressed("ui_up") and nbjump > 0):
			motion.y = JUMP_HEIGHT
			nbjump = 0
	if motion.y < 0 and Input.is_action_just_released("ui_up"):
		motion.y = 0
	motion = move_and_slide(motion,UP)
	pass

func update_sprite(dir : float):
	if (!kicking && !hurt):
		if dir < 0:
			_sprite.set_flip_h(true)
			if Input.is_action_pressed("ui_down"):
				_sprite.play("Crouch")
			else:
				_sprite.play("Move")
		elif dir > 0:
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
