extends CanvasLayer


onready var ui_root = get_node("UI")

onready var frames = ui_root.get_node("Frames")

onready var music = $Music
onready var sound_fx = $SoundFX
onready var scroll_fx = $ScrollFX

var once = false

var game_main_music = preload("res://assets/audio/musics/game_main_music.ogg")
var game_creidt_music = preload("res://assets/audio/musics/game_credit_music.ogg")
var gameplay_music = preload("res://assets/audio/musics/game_credit_music.ogg")

var sound_on = -12
var sound_off = -72

var music_on = -24 # -12
var music_off = -72


func _ready():
	get_tree().set_auto_accept_quit(false)
	music.set_volume_db(music_off)
	sound_fx.set_volume_db(sound_on)
	scroll_fx.set_volume_db(sound_on)
	pass


#func _process(delta):
#	frames.set_text(str(Engine.get_frames_per_second()))
#	pass


#func change_music(path):
#	if (path == "Main"):
#		$Music.stream = game_main_music
#	elif (path == "Credits"):
#		$Music.stream = game_creidt_music
#	elif (path == "Gameplay"):
#		$Music.stream = gameplay_music
#	$Music.play()
#	play()
#	pass


func play():
	$Music.set_volume_db(music_off)
	$Music.play()
	var val = music_off
	
	while $Music.get_volume_db() < music_on:
		val += 0.1
		$Music.set_volume_db(val)
		pass
	pass
