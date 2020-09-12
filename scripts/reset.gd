extends Panel


onready var sfx_player = utility.sound_fx

# Reset
onready var yes = get_node("Yes")
onready var no = get_node("No")


func _ready():
	# Reset
	yes.connect("pressed", self, "yes")
	no.connect("pressed", self, "no")
	pass


func yes():
	sfx_player.play()
	preference.rest_settings()
	preference.get_config()
	get_tree().reload_current_scene()
	pass


func no():
	sfx_player.play()
	self.hide()
	get_parent().get_node("Settings").show()
	pass
