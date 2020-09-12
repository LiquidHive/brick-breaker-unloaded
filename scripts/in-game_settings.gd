extends Control


onready var sfx_player = utility.sound_fx
onready var settings_root = self

# Settings
onready var sound = settings_root.get_node("Sound")
onready var music = settings_root.get_node("Music")
onready var settings_apply = settings_root.get_node("Apply")

var once = false

var sound_strings = [["SOUND ON", "SOUND OFF"], ["SONIDO ENCEDIDO", "SONIDO APAGADO"],
["SOM LIGADO", "SOM DESLIGADO"], ["SON ACTIVÉ", "ENGUEULER"]]

# Sound translations
var sound_on_eng = sound_strings[0][0]  #"Sound On"
var sound_off_eng = sound_strings[0][1] #"Sound Off"

var sound_on_es = sound_strings[1][0] #"Sonido Encedido"
var sound_off_es = sound_strings[1][1] #"Sonido Apagado"

var sound_on_pt = sound_strings[2][0] #"Som Ligado"
var sound_off_pt = sound_strings[2][1] #"Som Desligado"

var sound_on_fr = sound_strings[3][0] #"Son Activé"
var sound_off_fr = sound_strings[3][1] #"Engueuler"

var music_strings = [["MUSIC ON", "MUSIC OFF"], ["MÚSICA ENCENDIDA", "FUERA DE LA MÚSICA"],
["NA MÚSICA", "MÚSICA FORA"], ["MUSIQUE ALLUMÉE", "MUSIQUE OFF"]]

# Music translation
var music_on_eng = music_strings[0][0] #"Music On"
var music_off_eng = music_strings[0][1] #"Music Off"

var music_on_es = music_strings[1][0] #"Música Encendida"
var music_off_es = music_strings[1][1] #"Fuera De La Música"

var music_on_pt = music_strings[2][0] #"Na Música"
var music_off_pt = music_strings[2][1] #"Música Fora"

var music_on_fr = music_strings[3][0] #"Musique Allumée"
var music_off_fr = music_strings[3][1] #"Musique Off"


func _ready():
	set_process(true)
	
	sound.connect("pressed", self, "sound")
	music.connect("pressed", self, "music")
	settings_apply.connect("pressed", self, "apply")
	
	# Set the toggle mode
	if (preference.sound == true):
		sound.set_pressed(true)
	elif (preference.sound == false):
		sound.set_pressed(false)
	
	if (preference.music == true):
		music.set_pressed(true)
	elif (preference.music == false):
		music.set_pressed(false)
	pass


func _process(delta):
	if (once == false):
		if (self.is_visible()):
			# English
			if ((preference.sound == true) && (preference.language == "EN")):
				sound.set_text(sound_on_eng)
			elif ((preference.sound == false) && (preference.language == "EN")):
				sound.set_text(sound_off_eng)
			
			# Spanish
			if ((preference.sound == true) && (preference.language == "ES")):
				sound.set_text(sound_on_es)
			elif ((preference.sound == false) && (preference.language == "ES")):
				sound.set_text(sound_off_es)
			
			# Porteguese
			if ((preference.sound == true) && (preference.language == "PT")):
				sound.set_text(sound_on_pt)
			elif ((preference.sound == false) && (preference.language == "PT")):
				sound.set_text(sound_off_pt)
			
			# French
			if ((preference.sound == true) && (preference.language == "FR")):
				sound.set_text(sound_on_fr)
			elif ((preference.sound == false) && (preference.language == "FR")):
				sound.set_text(sound_off_fr)
			
			# Music - English
			if ((preference.music == true) && (preference.language == "EN")):
				music.set_text(music_on_eng)
			elif ((preference.music == false) && (preference.language == "EN")):
				music.set_text(music_off_eng)
			
			# Spanish
			if ((preference.music == true) && (preference.language == "ES")):
				music.set_text(music_on_es)
			elif ((preference.music == false) && (preference.language == "ES")):
				music.set_text(music_off_es)
			
			# Porteguese
			if ((preference.music == true) && (preference.language == "PT")):
				music.set_text(music_on_pt)
			elif ((preference.music == false) && (preference.language == "PT")):
				music.set_text(music_off_pt)
			
			# French
			if ((preference.music == true) && (preference.language == "FR")):
				music.set_text(music_on_fr)
			elif ((preference.music == false) && (preference.language == "FR")):
				music.set_text(music_off_fr)
			
			# English
			if ((preference.sound == true) && (TranslationServer.get_locale() == "en")):
				sound.set_text(sound_on_eng)
			elif ((preference.sound == false) && (TranslationServer.get_locale() == "en")):
				sound.set_text(sound_off_eng)
			
			# Spanish
			if ((preference.sound == true) && (TranslationServer.get_locale() == "es")):
				sound.set_text(sound_on_es)
			elif ((preference.sound == false) && (TranslationServer.get_locale() == "es")):
				sound.set_text(sound_off_es)
			
			# Porteguese
			if ((preference.sound == true) && (TranslationServer.get_locale() == "PT")):
				sound.set_text(sound_on_pt)
			elif ((preference.sound == false) && (TranslationServer.get_locale() == "PT")):
				sound.set_text(sound_off_pt)
			
			# French
			if ((preference.sound == true) && (TranslationServer.get_locale() == "fr")):
				sound.set_text(sound_on_fr)
			elif ((preference.sound == false) && (TranslationServer.get_locale() == "fr")):
				sound.set_text(sound_off_fr)
			
			
			# Music - English
			if ((preference.music == true) && (TranslationServer.get_locale() == "en")):
				music.set_text(music_on_eng)
			elif ((preference.music == false) && (TranslationServer.get_locale() == "en")):
				music.set_text(music_off_eng)
			
			# Spanish
			if ((preference.music == true) && (TranslationServer.get_locale() == "es")):
				music.set_text(music_on_es)
			elif ((preference.music == false) && (TranslationServer.get_locale() == "es")):
				music.set_text(music_off_es)
			
			# Porteguese
			if ((preference.music == true) && (TranslationServer.get_locale() == "pt")):
				music.set_text(music_on_pt)
			elif ((preference.music == false) && (TranslationServer.get_locale() == "pt")):
				music.set_text(music_off_pt)
			
			# French
			if ((preference.music == true) && (TranslationServer.get_locale() == "fr")):
				music.set_text(music_on_fr)
			elif ((preference.music == false) && (TranslationServer.get_locale() == "fr")):
				music.set_text(music_off_fr)
			once = true
	pass


func sound():
	sfx_player.play()
	
	# English
	if (sound.get_text() == sound_on_eng):
		sound.set_text(sound_off_eng)
	elif (sound.get_text() == sound_off_eng):
		sound.set_text(sound_on_eng)
	
	# Spanish
	if (sound.get_text() == sound_on_es):
		sound.set_text(sound_off_es)
	elif (sound.get_text() == sound_off_es):
		sound.set_text(sound_on_es)
	
	# Porteguese
	if (sound.get_text() == sound_on_pt):
		sound.set_text(sound_off_pt)
	elif (sound.get_text() == sound_off_pt):
		sound.set_text(sound_on_pt)
	
	# French
	if (sound.get_text() == sound_on_fr):
		sound.set_text(sound_off_fr)
	elif (sound.get_text() == sound_off_fr):
		sound.set_text(sound_on_fr)
	pass


func music():
	sfx_player.play()
	
	# English
	if (music.get_text() == music_on_eng):
		music.set_text(music_off_eng)
	elif (music.get_text() == music_off_eng):
		music.set_text(music_on_eng)
	
	# Spanish
	if (music.get_text() == music_on_es):
		music.set_text(music_off_es)
	elif (music.get_text() == music_off_es):
		music.set_text(music_on_es)
	
	# Porteguese
	if (music.get_text() == music_on_pt):
		music.set_text(music_off_pt)
	elif (music.get_text() == music_off_pt):
		music.set_text(music_on_pt)
	
	# French
	if (music.get_text() == music_on_fr):
		music.set_text(music_off_fr)
	elif (music.get_text() == music_off_fr):
		music.set_text(music_on_fr)
	pass


func apply():
	sfx_player.play()
	# English
	if (sound.get_text() == sound_on_eng):
		preference.sound = true
	elif (sound.get_text() == sound_off_eng):
		preference.sound = false
	
	# Spanish
	if (sound.get_text() == sound_on_es):
		preference.sound = true
	elif (sound.get_text() == sound_off_es):
		preference.sound = false
	
	# Porteguese
	if (sound.get_text() == sound_on_pt):
		preference.sound = true
	elif (sound.get_text() == sound_off_pt):
		preference.sound = false
	
	# French
	if (sound.get_text() == sound_on_fr):
		preference.sound = true
	elif (sound.get_text() == sound_on_fr):
		preference.sound = false
	
	##########################################################################
	
	# Music
	if (music.get_text() == music_on_eng):
		preference.music = true
	elif (music.get_text() == music_off_eng):
		preference.music = false
	
	# Spanish
	if (music.get_text() == music_on_es):
		preference.music = true
	elif (music.get_text() == music_off_es):
		preference.music = false
	
	# Porteguese
	if (music.get_text() == music_on_pt):
		preference.music = true
	elif (music.get_text() == music_off_pt):
		preference.music = false
	
	# French
	if (music.get_text() == music_on_fr):
		preference.music = true
	elif (music.get_text() == music_off_fr):
		preference.music = false
	
	once = false
	preference.apply_settings()
	
	if (get_parent().get_node("../").get_name() == "LevelCompleted"):
		get_parent().get_node("../Panel").show()
		get_parent().hide()
	else:
		get_parent().get_node("../Pause").show()
		get_parent().hide()
	pass
