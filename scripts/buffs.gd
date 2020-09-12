extends Area2D


var type = ""


func _ready():
	connect("body_entered", self, "body_entered")
	pass


func _physics_process(delta):
	position.y += 6 # buff drop movement.
	
	if (position.y > get_viewport_rect().end.y): # deletes the buff is it is off screen.
		queue_free()
	pass


func body_entered(body): # Checks to see if the buffs collide with the paddle.
	if (body.name == "Paddle"):
		
		if (type == "long_pad"):
			$"../../../".add_buffs("long_pad")
		elif (type == "short_pad"):
			$"../../../".add_buffs("short_pad")
		elif (type == "multi_balls"):
			$"../../../".add_buffs("multi_balls")
		elif (type == "laser"):
			$"../../../".add_buffs("laser")
		elif (type == "life"):
			$"../../../".add_buffs("life")
		elif (type == "slow"):
			$"../../../".add_buffs("slow")
		elif (type == "fast"):
			$"../../../".add_buffs("fast")
		queue_free()
	pass
