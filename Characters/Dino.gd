extends KinematicBody2D

onready var _sprite = $AnimatedSprite
onready var _item = $item_picked

onready var _walk = $sFxCharacter/WalkSound
onready var _jump = $sFxCharacter/JumpSound
onready var _crounch = $sFxCharacter/CrounchSound
onready var _land = $sFxCharacter/LandSound
onready var _skrrrt = $sFxCharacter/SkrrrtSound
onready var _kick = $sFxCharacter/KickSound

onready var _albino = preload("res://Characters/AlbinoAnimation.tres")
onready var _blue = preload("res://Characters/BlueAnimation.tres")
onready var _green = preload("res://Characters/GreenAnimation.tres")
onready var _red = preload("res://Characters/RedAnimation.tres")
onready var _yellow = preload("res://Characters/YellowAnimation.tres")

export var character: int

var konami_code = 0

var walk = false
var onfloor = true
var olddir = 0

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
var friction = false
var bodytokick = null

var item_picked_up = null


func _physics_process(delta: float) -> void:
	motion.y += GRAVITY
	friction = false
	directionx = Input.get_action_strength("right" + str(character))-Input.get_action_strength("left" + str(character))
	
	if item_picked_up != null:
		_item.set_texture(load(item_picked_up))
		_item.visible = true
	else:
		_item.visible = false

	if directionx != 0: #pressing a direction not both
		#direction will change the way acceleration will be added to motion (-1,1) depend which side running	
		motion.x = clamp(motion.x+ACCELERATION*directionx,-MAX_SPEED,MAX_SPEED) #cannot go under min speed or over maxspeed 
	else:
		friction = true #if no directin or both is push, friction is true
	update_sprite(directionx) #change the sprite to the way direction points
	if is_on_floor():
		nbjump = 1
		if friction == true:
			motion.x = lerp(motion.x,0, 0.2) #friction on the ground
	else:
		if friction == true:
			motion.x = lerp(motion.x,0, 0.05) #frictin on the jump
	if (Input.is_action_pressed("jump" + str(character)) and nbjump > 0):
			motion.y = JUMP_HEIGHT
			nbjump = 0
	if motion.y < 0 and Input.is_action_just_released("jump" + str(character)):
		motion.y = 0
	if hurt == true:
		_sprite.play("Hurt")
	if bodytokick != null && kicking == true:
		bodytokick.hurt = true
		bodytokick.item_picked_up = null
		if (_sprite.is_flipped_h()):
			bodytokick.motion.y = -500
			bodytokick.motion.x = -2000
		else:
			bodytokick.motion.y = -500
			bodytokick.motion.x = 2000
			
	motion = move_and_slide(motion,UP)
	
	#sound
	
	#sFx walk
	if directionx != 0 and is_on_floor():
		if walk == false:
			_walk.play()
			walk = true
	
	#sFx jump
	if Input.is_action_just_pressed("jump" + str(character)) and nbjump != 1:
		_jump.play()
	
	#sFx crounch
	if Input.is_action_just_pressed("down" + str(character)) and is_on_floor():
		_crounch.play()
		
	
	#sFx land
	if is_on_floor():
		if onfloor == false:
			_land.play()
			onfloor = true
	else:
		onfloor = false
	
	#sFxSkrrrt
	if is_on_floor():
		if olddir != directionx:
			_skrrrt.play()
			olddir = directionx
	else:
		olddir = directionx
	
func _on_WalkSound_finished():
	if walk == true:
		walk = false
	
	#soundEnd
	

func update_sprite(dir : float):
	if (!kicking && !hurt):
		if dir < 0:
			_sprite.set_flip_h(true)
			if Input.is_action_pressed("down"  + str(character)):
				_sprite.play("Crouch")
			else:
				_sprite.play("Move")
		elif dir > 0:
			_sprite.set_flip_h(false)
			if Input.is_action_pressed("down"  + str(character)):
				_sprite.play("Crouch")
			else:
				_sprite.play("Move")
		elif Input.is_action_pressed("down"  + str(character)):
			_sprite.play("CIdle")
		else:
			_sprite.play("Idle")
		
	if Input.is_action_just_pressed("kick"  + str(character)):
		if !kicking:
			_kick.play()
		_sprite.play("Kick")
		kicking = true
		item_picked_up = null

func _on_AnimatedSprite_animation_finished():
	if kicking: kicking = false
	if hurt: hurt = false
	
func _on_Area2D_body_entered(body: Node) -> void:
	if body.filename == "res://Characters/Dino.tscn" && body.name != name:
		bodytokick = body
		
func _on_Area2D_body_exited(body: Node) -> void:
	if body.filename == "res://Characters/Dino.tscn" && body.name != name:
		bodytokick = null

func _input(event):
	match konami_code:
		0: 
			if event.is_action_pressed("jump"  + str(character)): konami_code += 1
			else: konami_code = 0
		1: 
			if event.is_action_released("jump"  + str(character)): konami_code += 1
			else: konami_code = 0
		2: 
			if event.is_action_pressed("jump"  + str(character)): konami_code += 1
			else: konami_code = 0
		3: 
			if event.is_action_released("jump" + str(character)): konami_code += 1
			else: konami_code = 0
		4:
			if event.is_action_pressed("down" + str(character)): konami_code += 1
			else: konami_code = 0
		5:
			if event.is_action_released("down" + str(character)): konami_code += 1
			else: konami_code = 0
		6:
			if event.is_action_pressed("down" + str(character)): konami_code += 1
			else: konami_code = 0
		7:
			if event.is_action_released("down" + str(character)): konami_code += 1
			else: konami_code = 0
		8:
			if event.is_action_pressed("left" + str(character)): konami_code += 1
			else: konami_code = 0
		9:
			if event.is_action_released("left" + str(character)): konami_code += 1
			else: konami_code = 0
		10:
			if event.is_action_pressed("right" + str(character)): konami_code += 1
			else: konami_code = 0
		11:
			if event.is_action_released("right" + str(character)): konami_code += 1
			else: konami_code = 0
		12:
			if event.is_action_pressed("left" + str(character)): konami_code += 1
			else: konami_code = 0
		13:
			if event.is_action_released("left" + str(character)): konami_code += 1
			else: konami_code = 0
		14:
			if event.is_action_pressed("right" + str(character)): konami_code += 1
			else: konami_code = 0
		15:
			if event.is_action_released("right" + str(character)): konami_code += 1
			else: konami_code = 0
		16:
			if event.is_action_pressed("kick" + str(character)): konami_code += 1
			else: konami_code = 0
		16:
			if event.is_action_released("kick" + str(character)): konami_code += 1
			else: konami_code = 0
		17:
			if _sprite.get_sprite_frames() != _albino:
				_sprite.set_sprite_frames(_albino)
