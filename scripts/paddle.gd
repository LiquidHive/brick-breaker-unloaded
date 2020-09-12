extends KinematicBody2D


export var paddle_speed = 260.0
export var min_range = 103.818
export var max_range = 614.209

onready var ball = preload("res://scenes/items/balls/default_ball.tscn")
onready var laser_preload = preload("res://scenes/items/lasers/laser.tscn")

onready var tween = $Tween
onready var timer = $Timer

var ball_instance

var velocity = Vector2()

var touch_position = Vector2(0, 0)
var touch_drag = Vector2(0, 0)

var paddle_pos = Vector2(0, 0)

const UNITS = 2.1

var target_speed = 0 # Player movement value.

var has_hold = false
var was_pressed = false
var was_dragged = false

var spawn_ball = false
var track_ball = false

var once = true

var laser = false
var paddle_state = "normal"


# Called when the node enters the scene tree for the first time.
func _ready():
	preference.get_config()
	
	tween.connect("tween_completed", self, "tween_completed")
	timer.connect("timeout", self, "time_out")
	spawn_ball()
	pass # Replace with function body.


func tween_completed(object, key):
	was_pressed = false
	pass


func time_out():
	was_dragged = false
	pass


func _input(event):
	if ($"../../".can_move):
		if (preference.control == "touchscreen"):
			if (event is InputEventScreenTouch):
				if (event.pressed):
					if (spawn_ball == false):
						track_ball = false
						lunch_ball()
						spawn_ball = true
					
					if (laser):
						var laser_instance_one = laser_preload.instance()
						var laser_instance_two = laser_preload.instance()
						
						if (paddle_state == "normal"):
							laser_instance_one.global_position = $NormalLaser/Left.global_position
							laser_instance_two.global_position = $NormalLaser/Right.global_position
							get_parent().get_node("Lasers").add_child(laser_instance_one)
							get_parent().get_node("Lasers").add_child(laser_instance_two)
						if (paddle_state == "short_pad"):
							laser_instance_one.global_position = $ShortLaser/Left.global_position
							laser_instance_two.global_position = $ShortLaser/Right.global_position
							get_parent().get_node("Lasers").add_child(laser_instance_one)
							get_parent().get_node("Lasers").add_child(laser_instance_two)
						if (paddle_state == "long_pad"):
							laser_instance_one.global_position = $LongLaser/Left.global_position
							laser_instance_two.global_position = $LongLaser/Right.global_position
							get_parent().get_node("Lasers").add_child(laser_instance_one)
							get_parent().get_node("Lasers").add_child(laser_instance_two)
					
					was_pressed = true
					
					if (event.position.x > $Start.global_position.x && event.position.x < $End.global_position.x):
						if (event.position.y > $TopBoundary.global_position.y && event.position.y < $BottomBoundary.global_position.y):
							has_hold = true
				else:
					has_hold = false
					# timer.start()
					
					# if (was_pressed && was_dragged == false):
					# 	if (event.position.x < min_range):
					# 		tween.interpolate_property(self, "position", Vector2(position.x, 1184), Vector2(min_range, 1184), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
					# 	elif (event.position.x > max_range):
					# 		tween.interpolate_property(self, "position", Vector2(position.x, 1184), Vector2(max_range, 1184), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
					# 	else:
					# 		tween.interpolate_property(self, "position", Vector2(position.x, 1184), Vector2(event.position.x, 1184), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
					# 	tween.start()
			
			if (event is InputEventScreenDrag):
				was_dragged = true
				
				if (has_hold):
					if (event.position.x < min_range):
						position.x = min_range
					elif (event.position.x > max_range):
						position.x = max_range
					else:
						position.x = event.position.x
		
		elif (preference.control == "accelerometer"):
			if (event is InputEventScreenTouch):
				if (event.pressed):
					if (spawn_ball == false):
						track_ball = false
						lunch_ball()
						spawn_ball = true
					
					if (laser):
						var laser_instance_one = laser_preload.instance()
						var laser_instance_two = laser_preload.instance()
						
						if (paddle_state == "normal"):
							laser_instance_one.global_position = $NormalLaser/Left.global_position
							laser_instance_two.global_position = $NormalLaser/Right.global_position
							get_parent().get_node("Lasers").add_child(laser_instance_one)
							get_parent().get_node("Lasers").add_child(laser_instance_two)
						if (paddle_state == "short_pad"):
							laser_instance_one.global_position = $ShortLaser/Left.global_position
							laser_instance_two.global_position = $ShortLaser/Right.global_position
							get_parent().get_node("Lasers").add_child(laser_instance_one)
							get_parent().get_node("Lasers").add_child(laser_instance_two)
						if (paddle_state == "long_pad"):
							laser_instance_one.global_position = $LongLaser/Left.global_position
							laser_instance_two.global_position = $LongLaser/Right.global_position
							get_parent().get_node("Lasers").add_child(laser_instance_one)
							get_parent().get_node("Lasers").add_child(laser_instance_two)
					
					was_pressed = true
					
					if (event.position.x > $Start.global_position.x && event.position.x < $End.global_position.x):
						if (event.position.y > $TopBoundary.global_position.y && event.position.y < $BottomBoundary.global_position.y):
							has_hold = true
				else:
					has_hold = false
	pass


func _physics_process(delta):
	var move_left = Input.is_action_pressed("move_left")
	var move_right = Input.is_action_pressed("move_right")
	var jump = Input.is_action_just_pressed("action")
	
	if ($"../../".can_move):
		if (preference.control == "accelerometer"):
			if (Input.get_accelerometer().x > 3):
				Input.action_press("move_right")
				Input.action_release("move_left")
			elif (Input.get_accelerometer().x < -3):
				Input.action_press("move_left")
				Input.action_release("move_right")
			else:
				Input.action_release("move_left")
				Input.action_release("move_right")
		
		if (move_left): # Checks if the move_left input is being detected.
			target_speed = -UNITS
		elif (move_right): # Checks if the move_right input is being detected.
			target_speed = UNITS
		else:
			target_speed = 0
		
		if (track_ball == true):
			ball_instance.global_position.x = $BallSpawn.global_position.x
			ball_instance.gravity_scale = 0
		else:
			if (once):
				ball_instance.global_position.x = $BallSpawn.global_position.x
				ball_instance.gravity_scale = 0
				once = false
		
		if (jump):
			if (spawn_ball == false):
				track_ball = false
				lunch_ball()
				spawn_ball = true
			
			if (laser):
				var laser_instance_one = laser_preload.instance()
				var laser_instance_two = laser_preload.instance()
				
				if (paddle_state == "normal"):
					laser_instance_one.global_position = $NormalLaser/Left.global_position
					laser_instance_two.global_position = $NormalLaser/Right.global_position
					get_parent().get_node("Lasers").add_child(laser_instance_one)
					get_parent().get_node("Lasers").add_child(laser_instance_two)
				if (paddle_state == "short_pad"):
					laser_instance_one.global_position = $ShortLaser/Left.global_position
					laser_instance_two.global_position = $ShortLaser/Right.global_position
					get_parent().get_node("Lasers").add_child(laser_instance_one)
					get_parent().get_node("Lasers").add_child(laser_instance_two)
				if (paddle_state == "long_pad"):
					laser_instance_one.global_position = $LongLaser/Left.global_position
					laser_instance_two.global_position = $LongLaser/Right.global_position
					get_parent().get_node("Lasers").add_child(laser_instance_one)
					get_parent().get_node("Lasers").add_child(laser_instance_two)
		
		velocity.x = paddle_speed * target_speed
		velocity = move_and_slide(velocity, Vector2(0, -1))
	pass


func spawn_ball():
	ball_instance =  ball.instance()
	ball_instance.global_position = $BallSpawn.global_position
	get_parent().get_node("Balls").add_child(ball_instance)
	track_ball = true
	once = true
	pass


func lunch_ball():
	ball_instance.move = true
	ball_instance.gravity_scale = 0.5
	ball_instance.linear_velocity = Vector2(76, -500)
	pass
