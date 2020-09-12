extends Control


onready var sfx_player = utility.sound_fx

onready var menu_root = self
onready var settings_root = get_parent().get_node("Settings/Settings")
onready var help_root = get_parent().get_node("Help/Help")

onready var title = get_parent().get_node("Title")
onready var sub_title = get_parent().get_node("SubTitle")

# Main
onready var start = menu_root.get_node("Start")
onready var options = menu_root.get_node("Options")
onready var help = menu_root.get_node("Help")
onready var exit = menu_root.get_node("Exit")


func _ready():
	# Main menu
	start.connect("pressed", self, "start")
	options.connect("pressed", self, "options")
	help.connect("pressed", self, "help")
	exit.connect("pressed", self, "exit")
	pass


# Main functions
func start():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelOne"
	functions.loader()
	pass


func options():
	sfx_player.play()
	sub_title.text = "KEY_SETTINGS"
	
	menu_root.hide()
	settings_root.show()
	$"../Settings".once = false
	pass


func help():
	sub_title.text = "KEY_HELP"
	sfx_player.play()
	menu_root.hide()
	help_root.show()
	pass


func exit():
	sfx_player.play()
	variables.exit_state = "mian"
	
	if (TranslationServer.get_locale() == "en"):
		$"../SubTitle".text = "Exit"
	elif (TranslationServer.get_locale() == "es"):
		$"../SubTitle".text = "Exit"
	
	self.hide()
	$"../Exit".show()
	$"../../".was = "Main"
	pass
