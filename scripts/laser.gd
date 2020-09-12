extends Area2D


func _ready():
	connect("body_entered", self, "body_entered")
	pass


func _physics_process(delta):
	global_position.y -= 20
	
	if (global_position.y <= 216):
		queue_free()
	pass


func body_entered(body):
	if (body.is_in_group("brick")):
		if (body.solid == false):
			get_node("../../../").score_val += body.point
			get_node("../../../").add_point()
			body.queued()
	queue_free()
	pass
