extends Control


onready var sfx_player = utility.sound_fx

onready var title = get_parent().get_node("Title")
onready var menu_root = get_parent().get_node("Main")
onready var help_root = get_node("Help")
onready var credits_root = get_node("Credits")

onready var how_to_play_mobile = get_node("HowToPlayMobile")

# Help
onready var how_to_play = help_root.get_node("HowToPlay")
onready var remove_ads = help_root.get_node("RemoveAds")
onready var email_support = help_root.get_node("Feedback")
onready var rate = help_root.get_node("Rate")
onready var credits = help_root.get_node("Credits")
onready var help_back = help_root.get_node("Back")


func _ready():
	# Help
	how_to_play.connect("pressed", self, "how_to_play")
	remove_ads.connect("pressed", self, "remove_ads")
	email_support.connect("pressed", self, "email_support")
	rate.connect("pressed", self, "rate")
	credits.connect("pressed", self, "credits")
	help_back.connect("pressed", self, "help_back")
	
#	if ($"../../".device == "Mobile"):
#		iap.connect("purchase_success", self, "purchase_success_callback")
	pass


# Help functions
func how_to_play():
	sfx_player.play()
	$Help.hide()
	get_parent().get_node("SubTitle").hide()
	$HowToPlayMobile.show()
	pass


func email_support():
	sfx_player.play()
	
	var email = "liquidhive@gmail.com"
	var subject = "FEEDBACK/SUGGESTION"
	var body = """Please Enter your message here:
	
	_________________________________________
	Please Do Not Modify This:
	Game: Brick Breaker Unloaded
	Model: %s
	Game Version: %s
	_________________________________________
	
	Thank you for the feedback/suggestion!""" % [OS.get_model_name(), get_parent().get_node("../").game_version_num]
	
	OS.shell_open("mailto:" + email + "?subject=" + subject + "&body=" + str(body))
	pass


func rate():
	sfx_player.play()
	OS.shell_open("https://liquidhive.itch.io/brick-breaker-unloaded")
	pass


func credits():
	sfx_player.play()
	get_parent().get_node("Title").hide()
	get_parent().get_node("SubTitle").hide()
	help_root.hide()
	credits_root.show()
	pass


func help_back():
	sfx_player.play()
	help_root.hide()
	menu_root.show()
	title.show()
	$"../SubTitle".text = "KEY_MENU"
	pass
