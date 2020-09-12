extends Control


onready var button = $TextureButton


func _ready():
	button.connect("pressed", self, "tap")
	pass
 

func tap(): # When the user tap or click on the screen the credits screen is loaded and runs.
	variables.load_credits = true
	variables.credits_to_main = true
	get_parent().get_node("Help/Credits").show()
	self.hide()
	pass
