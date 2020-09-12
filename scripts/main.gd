extends Node


export var game_version_num = "0.1.0"
export (float) var credits_scroll_speed = .5
export (String, "Amazon", "Google") var platform = "Amazon"

export (String, "Mobile", "PC", "Console", "Web") var device = "Moblie"

onready var sfx_player = utility.sound_fx

onready var credits_menu = get_node("UI/Help/Credits")
onready var timer_run = get_node("UI/Help/Credits")

onready var title = get_node("UI/Title")
onready var language_root = get_node("UI/Language")
onready var main_root = get_node("UI/Main")
onready var settings_root = get_node("UI/Settings/Settings")
onready var reset_root = get_node("UI/Settings/Reset")
onready var help_root = get_node("UI/Help/Help")
onready var credits_root = get_node("UI/Help/Credits")
onready var exit_root = get_node("UI/Exit")

var was = ""

var timer = Timer.new()


func _ready():
	preference.check()
	preference.get_config()
	preference.apply_settings()
	
	if (preference.language == "NULL"):
		main_root.hide()
		$UI/SubTitle.hide()
		language_root.show()
	
	if (variables.how_to_play == true):
		print("!")
		$UI/Main.hide()
		$UI/SubTitle.hide()
		$UI/Help/HowToPlayMobile.show()
	pass


func _process(delta):
	if (variables.completed_screen == true):
		title.hide()
		$UI/SubTitle.hide()
		main_root.hide()
		$UI/CompletedGame.show()
		variables.completed_screen = false
	pass


func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST || Input.is_action_just_pressed("ui_cancel")):
		sfx_player.play()
		if (language_root.is_visible()):
			variables.exit_state = "language"
			language_root.hide()
			exit_root.show()
			was = "Language"
		elif (main_root.is_visible()):
			variables.exit_state = "main"
			$"UI/SubTitle".text = "KEY_EXIT_MENU"
			main_root.hide()
			exit_root.show()
			was = "Main"
		elif (settings_root.is_visible()):
			title.show()
			settings_root.hide()
			main_root.show()
			get_node("UI/Settings").once = false
		elif (help_root.is_visible()):
			title.show()
			main_root.show()
			help_root.hide()
		elif (reset_root.is_visible()):
			reset_root.hide()
			settings_root.show()
		elif (exit_root.is_visible() && was == "Language"):
			title.show()
			exit_root.hide()
			language_root.show()
		elif (exit_root.is_visible() && was == "Main"):
			title.show()
			exit_root.hide()
			main_root.show()
	pass
