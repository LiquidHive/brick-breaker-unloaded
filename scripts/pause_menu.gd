extends CanvasLayer


onready var sfx_player = utility.sound_fx
onready var pause_root = $UI/Pause
onready var gameover_root = $UI/GameOver
onready var settings_root = $UI/Settings

onready var resume = pause_root.get_node("Resume")
onready var respawn = pause_root.get_node("Respawn")
onready var settings = pause_root.get_node("Settings")
onready var quit = pause_root.get_node("Quit")

onready var gameover_respawn = gameover_root.get_node("Respawn")
onready var gameover_settings = gameover_root.get_node("Settings")
onready var gameover_quit = gameover_root.get_node("Quit")

onready var pause_button = get_node("PauseButton")

#onready var level_num = get_node("UI/LevelNum")

onready var pause_label = get_node("UI/Pause/Label")

var once = false

var pause_string = ["PAUSE", "PAUSA", "PAUSA", "PAUSE"]

var pause_en = pause_string[0]
var pause_es = pause_string[1]
var pause_pt = pause_string[2]
var pause_fr = pause_string[3]



func _ready():
	$Timer.connect("timeout", self, "timeout")
	
	resume.connect("pressed", self, "resume")
	respawn.connect("pressed", self, "respawn")
	settings.connect("pressed", self, "settings")
	quit.connect("pressed", self, "quit")
	
	gameover_respawn.connect("pressed", self, "gameover_respawn")
	gameover_settings.connect("pressed", self, "gameover_settings")
	gameover_quit.connect("pressed", self, "gameover_quit")
	
	pause_button.connect("pressed", self, "pause")
	
	if (preference.language == "EN"):
		pause_label.set_text(pause_en)
	elif (preference.language == "ES"):
		pause_label.set_text(pause_es)
	elif (preference.language == "PT"):
		pause_label.set_text(pause_pt)
	elif (preference.language == "FR"):
		pause_label.set_text(pause_fr)
	pass


func _process(delta):
	pass


func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		sfx_player.play()
		if (!pause_root.is_visible() && !settings_root.is_visible() && once == false):
			pause()
		elif (pause_root.is_visible() && once == true):
			resume()
		elif (settings_root.is_visible()):
			pause()
	pass


func _input(event):
	if (Input.is_action_just_pressed("ui_menu")):
		if (!pause_root.is_visible() && !settings_root.is_visible() && once == false):
			pause()
		elif (pause_root.is_visible() && once == true):
			resume()
		elif (settings_root.is_visible()):
			pause()
	pass


func pause():
	sfx_player.play()
	get_tree().set_pause(true)
	get_parent().get_node("Game").hide()
#	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	settings_root.hide()
	pause_root.show()
	pause_button.hide()
	once = true
	pass


func gameover_respawn():
	sfx_player.play()
	if (get_parent().name != "Stage1Level1"):
		variables.loading_screen = "StageOneLevelOne"
		functions.loader()
	else:
		get_tree().reload_current_scene()
	pass


func gameover_settings():
	settings()
	pass


func gameover_quit():
	quit()
	pass


func ads_pause():
	get_tree().set_pause(true)
#	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	settings_root.hide()
	pause_root.show()
	pause_button.hide()
	once = true
	pass


func resume():
	get_tree().set_pause(false)
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_parent().get_node("Game").show()
	sfx_player.play()
	settings_root.hide()
	pause_root.hide()
	pause_button.show()
	once = false
	pass


func respawn():
	sfx_player.play()
	resume()
	get_tree().reload_current_scene()
	pass


func settings():
	sfx_player.play()
	pause_root.hide()
	settings_root.show()
	once = true
	pass


func quit():
	sfx_player.play()
	variables.loading_screen = "Menu"
	functions.loader()
	get_tree().set_pause(false)
	pass


func timeout():
	once = false
	pass
