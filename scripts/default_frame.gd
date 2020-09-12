extends NinePatchRect


var frame_area = ""


func _ready():
	$"LeftArea".connect("body_entered", self, "left_area")
	$"RightArea".connect("body_entered", self, "right_area")
	$"TopArea".connect("body_entered", self, "top_area")
	pass


func left_area(body):
	if (body.is_in_group("ball")):
		frame_area = "left"
	pass


func right_area(body):
	if (body.is_in_group("ball")):
		frame_area = "right"
	pass


func top_area(body):
	if (body.is_in_group("ball")):
		frame_area = "top"
	pass
