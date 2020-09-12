extends Control


onready var anim = get_node("AnimationPlayer")
onready var timer = get_node("Timer")

var anim_name = "intro"


func _ready():
	set_process(true)
	
	anim.play("Intro")
	timer.connect("timeout", self, "tap")
	pass


func _process(delta):
	if (not anim.is_playing() && anim_name == "intro"):
		anim_name = "blink"
		timer.start()
	pass


func tap():
	variables.loading_screen = "Menu"
	functions.loader()
	pass
