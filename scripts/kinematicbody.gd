extends KinematicBody2D


export var player_speed = 260.0
# export var air_speed = 240.0
export var acceleration = 0.25
# export var air_acceleration = 0.2
export var jump_height = 960.0 #630.0
export var wall_height = 980.0 #630.0
export var extra_jump_height = 760.0 #530.0
export var max_jump = 2

export var gravity = 2800 # 1300
export var wall_gravity = 4200 # 1300

export var can_move = true
export var can_jump = true
export var flip_gravity = false
export var multi_jump = true
export var can_air_jump = true
export var can_gravity = true

export var wall_fall_time = 0.3

onready var default = preload("res://assets/graphics/characters/default.png")
onready var custom_2 = preload("res://assets/graphics/characters/custom_2.png")
onready var custom_3 = preload("res://assets/graphics/characters/custom_3.png")
onready var custom_4 = preload("res://assets/graphics/characters/custom_4.png")
onready var custom_5 = preload("res://assets/graphics/characters/custom_5.png")
onready var custom_6 = preload("res://assets/graphics/characters/custom_6.png")
onready var custom_7 = preload("res://assets/graphics/characters/custom_7.png")
onready var custom_8 = preload("res://assets/graphics/characters/custom_8.png")
onready var custom_9 = preload("res://assets/graphics/characters/custom_9.png")
onready var custom_10 = preload("res://assets/graphics/characters/custom_10.png")

onready var raycast_down = get_node("RayCast2DDown")
onready var raycast_down_2 = get_node("RayCast2DDown 2")
onready var raycast_down_3 = get_node("RayCast2DDown 3")

onready var raycast_front = get_node("RayCast2DFront")
onready var raycast_front_2 = get_node("RayCast2DFront 2")
onready var raycast_front_3 = get_node("RayCast2DFront 3")

var is_raycast_down
var is_raycast_front

onready var animator = get_node("AnimationPlayer")

signal left_pressed
signal right_pressed
signal null_pressed

signal jump_pressed
signal jump_null

const UNITS = 2.1

var direction_string = ""
var jump_string = ""

var sqaush_val = false
var gravity_flip = false

var air_jump = true
var has_jump = false
var once = false

var wall_drop = false
var drop_once = false

var player_mode = "air"

var velocity = Vector2()
var orientation = "right"
var jumps = 0

var is_die = false


func _ready():
	connect("left_pressed", self, "left_pressed")
	connect("right_pressed", self, "right_pressed")
	connect("null_pressed", self, "null_pressed")
	
	connect("jump_pressed", self, "jump_pressed")
	connect("jump_null", self, "jump_null")
	
	if ($OnScreenButtons.press == true):
		if (preference.directional_side == "left"):
			$OnScreenButtons/Buttons/RightJumpButton.action = "jump"
		elif (preference.directional_side == "right"):
			$OnScreenButtons/Buttons/LeftJumpButton.action = "jump"
	
	$WallFall.set_wait_time(wall_fall_time)
	$WallFall.connect("timeout", self, "wall_fall")
	
	preference.get_config()
	
	if (variables.player_skin == "default"):
		$Sprite.texture = default
		$Particles2D.texture = default
	if (variables.player_skin == "custom_2"):
		$Sprite.texture = custom_2
		$Particles2D.texture = custom_2
	if (variables.player_skin == "custom_3"):
		$Sprite.texture = custom_3
		$Particles2D.texture = custom_3
	if (variables.player_skin == "custom_4"):
		$Sprite.texture = custom_4
		$Particles2D.texture = custom_4
	if (variables.player_skin == "custom_5"):
		$Sprite.texture = custom_5
		$Particles2D.texture = custom_5
	if (variables.player_skin == "custom_6"):
		$Sprite.texture = custom_6
		$Particles2D.texture = custom_6
	if (variables.player_skin == "custom_7"):
		$Sprite.texture = custom_7
		$Particles2D.texture = custom_7
	if (variables.player_skin == "custom_8"):
		$Sprite.texture = custom_8
		$Particles2D.texture = custom_8
	if (variables.player_skin == "custom_9"):
		$Sprite.texture = custom_9
		$Particles2D.texture = custom_9
	if (variables.player_skin == "custom_10"):
		$Sprite.texture = custom_10
		$Particles2D.texture = custom_10
	pass


func _process(delta):
	if (raycast_down.is_colliding() || raycast_down_2.is_colliding() || raycast_down_3.is_colliding()):
		is_raycast_down = true
	elif (!raycast_down.is_colliding() || !raycast_down_2.is_colliding() || !raycast_down_3.is_colliding()):
		is_raycast_down = false
	
	if (raycast_front.is_colliding() || raycast_front_2.is_colliding() || raycast_front_3.is_colliding()):
		is_raycast_front = true
	elif (!raycast_front.is_colliding() || !raycast_front_2.is_colliding() || !raycast_front_3.is_colliding()):
		is_raycast_front = false
	
	if (orientation == "left"):
		raycast_front.scale = Vector2(-1, 1)
		raycast_front_2.scale = Vector2(-1, 1)
		raycast_front_3.scale = Vector2(-1, 1)
	elif (orientation == "right"):
		raycast_front.scale = Vector2(1, 1)
		raycast_front_2.scale = Vector2(1, 1)
		raycast_front_3.scale = Vector2(1, 1)
	
	if (position.y >= 1876):
		$Camera2D.limit_left = -10000000
	
	motion(delta)
	movement(delta)
	pass


#func _physics_process(delta): # Runs every fixed update frame.
#	movement(delta)
#	pass


func die():
	get_node("Sound").play()
	
	for i in get_parent().get_children():
		if (i.get_name() == "Platforms"):
			for u in i.get_children():
				u.get_node("KinematicBody2D").add_collision_exception_with(self)
		
		$Sprite.hide()
		is_die = true
		$Particles2D.set_emitting(true)
		$Sound.play()
		can_move = false
		can_jump = false
		can_air_jump = false
		can_gravity = false
		functions.die()
	pass


func reset():
	$Sprite.show()
	$Particles2D.set_emitting(false)
	
	is_die = false
	can_move = true
	can_jump = true
	can_air_jump = true
	can_gravity = true
	
	once = true
	pass

func motion(delta):
	if (is_die == false):
		if (is_raycast_down):
#			if ($"RayCast2DDown".get_collider().get_node("../../").is_in_group("platform") || $"RayCast2DDown 2".get_collider().get_node("../../").is_in_group("platform") || $"RayCast2DDown 3".get_collider().get_node("../../").is_in_group("platform")):
				variables.play_to_plat = true
#			else:
#				variables.play_to_plat = false
	
	if (is_raycast_down):
		player_mode = "ground"
		wall_drop = false
	
	if (player_mode == "ground"): # If on the ground.
		can_air_jump = true
		
		if (sqaush_val == true):
			animator.play("Sqaush")
			sqaush_val = false
		
		if (once == true):
			get_parent().reset = true
			functions.rand_once = false
			functions.once = false
			once = false
	pass


func movement(delta): # Ground state.
	if (flip_gravity == true): # Apply gravity
		if (Input.is_action_just_pressed("flip")):
			set_scale(Vector2(get_scale().x, get_scale().y * -1))  # this flap the player up-side-down
			
			if (gravity_flip == false):
				gravity_flip = true
			elif (gravity_flip == true):
				gravity_flip = false
	
	if (player_mode == "wall"): # These are for player mode.
		if (can_gravity):
			if (gravity_flip == false):
				velocity.y += delta * gravity
			else:
				velocity.y += delta * -gravity
			
			if (Input.is_action_pressed("move_left") && orientation == "left"):
				velocity.y = 0
				drop_once = false
				wall_drop = false
				$WallFall.stop()
			elif (Input.is_action_pressed("move_right") && orientation == "right"):
				velocity.y = 0
				drop_once = false
				wall_drop = false
				$WallFall.stop()
			elif (!Input.is_action_pressed("move_left") || !Input.is_action_pressed("move_right")):
				if (drop_once == false):
					$WallFall.start()
					drop_once = true
			
			if (direction_string == "left" && orientation == "left"):
				velocity.y = 0
				drop_once = false
				wall_drop = false
				$WallFall.stop()
			elif (direction_string == "right" && orientation == "right"):
				velocity.y = 0
				drop_once = false
				wall_drop = false
				$WallFall.stop()
			elif (direction_string == "null"):
				if (drop_once == false):
					$WallFall.start()
					drop_once = true
			
			if (wall_drop == true):
				if (gravity_flip == false):
					velocity.y += delta * gravity
				else:
					velocity.y += delta * -gravity
		else:
			velocity.y = 0
		
		if (velocity.y == 0 && can_gravity == true):
			if (gravity_flip == false):
				velocity.y += delta * wall_gravity
			else:
				velocity.y += delta * -wall_gravity
	else:
		if (can_gravity):
			if (gravity_flip == false):
				velocity.y += delta * gravity
			else:
				velocity.y += delta * -gravity
		else:
			velocity.y = 0
	
#	print(velocity.x)
#	print(velocity.y)
#	print(player_mode)
#	print(can_gravity)
	
	# Gets input logic.
	var move_left = Input.is_action_pressed("move_left")
	var move_right = Input.is_action_pressed("move_right")
	var jump = Input.is_action_just_pressed("jump")
	
	
	var target_speed = 0 # Player movement value.
	
	if (player_mode == "ground"): # If on the ground.
		if (can_move == true):
			air_jump = true
			has_jump = false
			jumps = 0
			
			if (move_left): # Checks if the move_left input is being detected.
				target_speed = -UNITS
				orientation = "left"
				get_parent().get_node("LevelCompleted").timer_run()
			
			elif (move_right): # Checks if the move_right input is being detected.
				target_speed = UNITS
				orientation = "right"
				get_parent().get_node("LevelCompleted").timer_run()
			
			if (direction_string == "left"): # Checks if the move_left input is being detected.
				target_speed = -UNITS
				orientation = "left"
				get_parent().get_node("LevelCompleted").timer_run()
			
			elif (direction_string == "right"): # Checks if the move_right input is being detected.
				target_speed = UNITS
				orientation = "right"
				get_parent().get_node("LevelCompleted").timer_run()
		else:
			target_speed = 0
		
		if (can_jump == true): # Checks if the player can jump.
			if (jump && selector.ui_accept == false): # Checks if the jump input is detected.
				animator.play("Jump") # play jump animation.
				air_jump = false
				has_jump = true
				jumps += 1
				get_parent().get_node("LevelCompleted").timer_run()
				
				if (gravity_flip == false):
					velocity.y -= jump_height # Adds force upwards for player to jump.
				else:
					velocity.y += jump_height # Adds force upwards for player to jump.
			
			if (jump_string == "jump"): # Checks if the jump input is detected.
				animator.play("Jump") # play jump animation.
				air_jump = false
				has_jump = true
				jumps += 1
				get_parent().get_node("LevelCompleted").timer_run()
				
				if (gravity_flip == false):
					velocity.y -= jump_height # Adds force upwards for player to jump.
				else:
					velocity.y += jump_height # Adds force upwards for player to jump.
		
		if (is_raycast_down == false):
			player_mode = "air"
	
	elif (player_mode == "air"): # If the player is in the air.
		sqaush_val = true
		
		if (is_raycast_front):
			player_mode = "wall"
		
		if (can_move == true):
			if (move_left): # Checks if the move_left input is being detected.
				target_speed = -UNITS
				orientation = "left"
				get_parent().get_node("LevelCompleted").timer_run()
			
			elif (move_right): # Checks if the move_right input is being detected.
				target_speed = UNITS
				orientation = "right"
				get_parent().get_node("LevelCompleted").timer_run()
			
			if (direction_string == "left"): # Checks if the move_left input is being detected.
				target_speed = -UNITS
				orientation = "left"
				get_parent().get_node("LevelCompleted").timer_run()
			
			elif (direction_string == "right"): # Checks if the move_right input is being detected.
				target_speed = UNITS
				orientation = "right"
				get_parent().get_node("LevelCompleted").timer_run()
		else:
			target_speed = 0
		
		if (can_jump == true):
			if (jump && selector.ui_accept == false && air_jump == true && has_jump == false): # Player can jump in the air once.
				if (can_air_jump == true):
					animator.play("Jump") # play jump animation.
					
					if (gravity_flip == false):
						velocity.y = -extra_jump_height
					else:
						velocity.y = extra_jump_height
				air_jump = false
			
			if (jump_string == "jump" && air_jump == true && has_jump == false): # Player can jump in the air once.
				if (can_air_jump == true):
					animator.play("Jump") # play jump animation.
					
					if (gravity_flip == false):
						velocity.y = -extra_jump_height
					else:
						velocity.y = extra_jump_height
				air_jump = false
			
			if (jump && jumps != max_jump && has_jump == true): # Player can multi jump.
				if (multi_jump == true):
					animator.play("Jump") # play jump animation.
					
					if (gravity_flip == false):
						velocity.y = -extra_jump_height
					else:
						velocity.y = extra_jump_height
				jumps += 1
			
			if (jump_string == "jump" && jumps != max_jump && has_jump == true): # Player can multi jump.
				if (multi_jump == true):
					animator.play("Jump") # play jump animation.
					
					if (gravity_flip == false):
						velocity.y = -extra_jump_height
					else:
						velocity.y = extra_jump_height
				jumps += 1
	
	elif (player_mode == "wall"): # If player is on the wall.
		has_jump = true
		jumps = 0
		
		if (can_move == true):
			if (move_left && !Input.is_action_pressed("jump")): # Checks if the move_left input is being detected.
				target_speed = -UNITS
				orientation = "left"
			
			elif (move_right && !Input.is_action_pressed("jump")): # Checks if the move_right input is being detected.
				target_speed = UNITS
				orientation = "right"
			
			if (direction_string == "left" && !Input.is_action_pressed("jump")): # Checks if the move_left input is being detected.
				target_speed = -UNITS
				orientation = "left"
			
			elif (direction_string == "right" && !Input.is_action_pressed("jump")): # Checks if the move_right input is being detected.
				target_speed = UNITS
				orientation = "right"
		
		else:
			target_speed = 0
			can_gravity = false
		
		if (can_jump == true):
			if (move_left && !move_right && orientation == "right" && Input.is_action_pressed("jump")): # Checks if the move_left input is being detected.
				animator.play("Jump")
				jumps += 1
				target_speed = -UNITS
				
				if (gravity_flip == false):
					velocity.y = -wall_height # Adds force upwards for player to jump.
				else:
					velocity.y = wall_height # Adds force upwards for player to jump.
			
			elif (move_right && !move_left && orientation == "left" && Input.is_action_pressed("jump")): # Checks if the move_right input is being detected.
				animator.play("Jump")
				jumps += 1
				target_speed = UNITS
				
				if (gravity_flip == false):
					velocity.y = -wall_height # Adds force upwards for player to jump.
				else:
					velocity.y = wall_height # Adds force upwards for player to jump.
			
			if (direction_string == "left" && direction_string != "right" && orientation == "right" && Input.is_action_pressed("jump")): # Touch screen input.
				animator.play("Jump")
				jumps += 1
				target_speed = -UNITS
				
				if (gravity_flip == false):
					velocity.y = -wall_height # Adds force upwards for player to jump.
				else:
					velocity.y = wall_height # Adds force upwards for player to jump.
			
			elif (direction_string == "right" && direction_string != "left" && orientation == "left" && Input.is_action_pressed("jump")): # Touch screen input.
				animator.play("Jump")
				jumps += 1
				target_speed = UNITS
				
				if (gravity_flip == false):
					velocity.y = -wall_height # Adds force upwards for player to jump.
				else:
					velocity.y = wall_height # Adds force upwards for player to jump.
		
		if (is_raycast_down == false && is_raycast_front == false):
			player_mode = "air"
	
	# velocity.x = lerp(velocity.x, player_speed * target_speed, acceleration) # imterpolates between two values.
	velocity.x = player_speed * target_speed
	velocity = move_and_slide(velocity, Vector2(0, -1))
	pass


func wall_fall():
	wall_drop = true
	pass


func left_pressed():
	direction_string = "left"
	pass


func right_pressed():
	direction_string = "right"
	pass


func null_pressed():
	direction_string = "null"
	pass


func jump_pressed():
	jump_string = "jump"
	pass


func jump_null():
	jump_string = "null"
	pass
