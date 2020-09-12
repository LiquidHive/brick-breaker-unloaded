extends Panel


onready var sfx_player = utility.sound_fx

onready var exit_yes = get_node("Yes")
onready var exit_no = get_node("No")


func _ready():
	# Exit
	exit_yes.connect("pressed", self, "exit_yes")
	exit_no.connect("pressed", self, "exit_no")
	pass


func exit_yes():
	sfx_player.play()
	get_tree().quit()
	pass


func exit_no():
	sfx_player.play()
	if (variables.exit_state == "language"):
		self.hide()
		get_parent().get_node("Language").show()
		get_parent().get_node("Title").show()
		get_tree().get_root().get_node("/root/selector").scene = "Second"
		get_tree().get_root().get_node("/root/selector").state = "Language"
		get_tree().get_root().get_node("/root/selector").once = false
	else:
		self.hide()
		get_parent().get_node("Main").show()
		get_parent().get_node("Title").show()
		get_tree().get_root().get_node("/root/selector").scene = "Second"
		get_tree().get_root().get_node("/root/selector").state = "Main"
		get_tree().get_root().get_node("/root/selector").once = false
	$"../SubTitle".text = "KEY_MENU"
	pass
