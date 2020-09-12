extends RigidBody2D

const BALL_SPEED = 100
var direction = Vector2(4, -2)
var speed = BALL_SPEED

onready var initial_pos = self.position

var move = false

const SPEED_UP = 400
const MAX_SPEED = 30000

var quit = false


func _physics_process(delta):
	if (move):
		position += direction * speed * delta
	
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if (body.is_in_group("brick")):
			if (body.solid == false):
				get_node("../../../").score_val += body.point
				get_node("../../../").add_point()
				body.queued()
		
		if (body.get_name() == "Paddle"):
			var speed = linear_velocity.length()
			var direction = position - body.get_node("Anchor").global_position
			var volocity = direction.normalized() * min(speed + SPEED_UP * delta, MAX_SPEED * delta)
			linear_velocity = volocity
		
		if (body.get_name() == "Frame"):
			if ($"../../Frame".frame_area == "left"):
					var speed = linear_velocity.length()
					var direction = position - body.get_node("PositionalPoints/Left").global_position
					var volocity = direction.normalized() * min(speed + SPEED_UP * delta, MAX_SPEED * delta)
					linear_velocity = volocity
			elif ($"../../Frame".frame_area == "right"):
					var speed = linear_velocity.length()
					var direction = position - body.get_node("PositionalPoints/Right").global_position
					var volocity = direction.normalized() * min(speed + SPEED_UP * delta, MAX_SPEED * delta)
					linear_velocity = volocity
			elif ($"../../Frame".frame_area == "top"):
					var speed = linear_velocity.length()
					var direction = position - body.get_node("PositionalPoints/Top").global_position
					var volocity = direction.normalized() * min(speed + SPEED_UP * delta, MAX_SPEED * delta)
					linear_velocity = volocity
	
#	if ("fast" in get_parent().get_node("../../").buffs || "slow" in get_parent().get_node("../../").buffs):
#		if ($"../../../".ball_modifier):
#			if (linear_velocity < get_parent().get_node("../../").speed_val):
#				linear_velocity = get_parent().get_node("../../").speed_val
	
	if (position.y > get_viewport_rect().end.y || position.y < 192):
		functions.die()
		move = false
		get_node("../../../").remove_buffs()
		queue_free()
	
	if (position.x > get_viewport_rect().end.x || position.x < 0):
		functions.die()
		move = false
		get_node("../../../").remove_buffs()
		queue_free()
	pass
