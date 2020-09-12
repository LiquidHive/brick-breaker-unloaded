extends Control


onready var sfx_player = utility.sound_fx

onready var settings_root = get_node("Settings")
#onready var exit_control_root = get_node("EditControl")
onready var reset_root = get_node("Reset")

# Settings
onready var sound = get_node("Settings/Sound")
onready var music = get_node("Settings/Music")
onready var language = get_node("Settings/Language")
onready var reset = get_node("Settings/Reset")
onready var edit_control = get_node("Settings/EditControl")
onready var settings_apply = get_node("Settings/Apply")

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


var eng_lang_strings = ["ENGLISH", "SPANISH", "PORTUGUESE", "FRENCH"]

# English translations
var language_english_eng = eng_lang_strings[0] #"English"
var language_english_es = eng_lang_strings[1] #"Spanish"
var language_english_pt = eng_lang_strings[2] #"Portuguese"
var language_english_fr = eng_lang_strings[3] #"French"

var es_lang_strings = ["INGLÉS", "ESPAÑOL", "PORTUGUÉS", "FRANCÉS"]

# Spanish translations
var language_spanish_eng = es_lang_strings[0] #"Inglés"
var language_spanish_es = es_lang_strings[1] #"Español"
var language_spanish_pt = es_lang_strings[2] #"Portugués"
var language_spanish_fr = es_lang_strings[3] #"francés"

var pt_lang_strings = ["INGLÊS", "ESPANHOL", "PORTUGUÊS", "FRANCÊS"]

# Portuguese translations
var language_portuguese_eng = pt_lang_strings[0] #"Inglês"
var language_portuguese_es = pt_lang_strings[1] #"Espanhol"
var language_portuguese_pt = pt_lang_strings[2] #"Português"
var language_portuguese_fr = pt_lang_strings[3] #"Francês"

var fr_lang_strings = ["ANGLAIS", "ESPANOL", "PORTUGAIS", "FRANÇAIS"]

# French translations
var language_french_eng = fr_lang_strings[0] #"Anglais"
var language_french_es = fr_lang_strings[1] #"Espanol"
var language_french_pt = fr_lang_strings[2] #"Portugais"
var language_french_fr = fr_lang_strings[3] #"Français"


func _ready():
	set_process(true)
	
	sound.connect("pressed", self, "sound")
	music.connect("pressed", self, "music")
	language.connect("pressed", self, "language")
	reset.connect("pressed", self, "reset")
	edit_control.connect("pressed", self, "edit_control")
	settings_apply.connect("pressed", self, "apply")
	pass


func _process(delta):
	if (once == false):
		if (settings_root.is_visible()):
			# Set the toggle mode
			if (preference.sound == true):
				sound.set_pressed(true)
			elif (preference.sound == false):
				sound.set_pressed(false)
			
			if (preference.music == true):
				music.set_pressed(true)
			elif (preference.music == false):
				music.set_pressed(false)
			
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
			
			# Language
			if (preference.language == "EN"):
				language.set_text(language_english_eng)
				TranslationServer.set_locale("en")
			elif (preference.language == "ES"):
				language.set_text(language_spanish_es)
				TranslationServer.set_locale("es")
			elif (preference.language == "PT"):
				language.set_text(language_portuguese_pt)
				TranslationServer.set_locale("pt")
			elif (preference.language == "FR"):
				language.set_text(language_french_fr)
				TranslationServer.set_locale("fr")
			
			if (preference.control == "touchscreen"):
				if (TranslationServer.get_locale() == "en"):
					edit_control.text = "CONTROL: TOUCHSCREEN"
				elif (TranslationServer.get_locale() == "es"):
					edit_control.text = "CONTROL: PANTALLA TÁCTIL"
				elif (TranslationServer.get_locale() == "pt"):
					edit_control.text = "CONTROLO: TOUCHSCREEN"
				elif (TranslationServer.get_locale() == "fr"):
					edit_control.text = "CONTRÔLE: ÉCRAN TACTILE"
			elif (preference.control == "accelerometer"):
				if (TranslationServer.get_locale() == "en"):
					edit_control.text = "CONTROL: ACCELEROMETER"
				elif (TranslationServer.get_locale() == "es"):
					edit_control.text = "CONTROL: ACELEROMETRO"
				elif (TranslationServer.get_locale() == "pt"):
					edit_control.text = "CONTROLO: ACELERÔMETRO"
				elif (TranslationServer.get_locale() == "fr"):
					edit_control.text = "CONTRÔLE: ACCÉLÉROMÈTRE"
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


func language():
	sfx_player.play()
	
	if (language.get_text() == language_english_eng):
		language.set_text(language_spanish_es)
	elif (language.get_text() == language_spanish_es):
		language.set_text(language_portuguese_pt)
	elif (language.get_text() == language_portuguese_pt):
		language.set_text(language_french_fr)
	elif (language.get_text() == language_french_fr):
		language.set_text(language_english_eng)
	pass


func reset():
	sfx_player.play()
	settings_root.hide()
	reset_root.show()
	pass

func edit_control():
	sfx_player.play()
	
	if (TranslationServer.get_locale() == "en"):
		if (edit_control.text == "CONTROL: TOUCHSCREEN"):
			edit_control.text = "CONTROL: ACCELEROMETER"
		elif (edit_control.text == "CONTROL: ACCELEROMETER"):
			edit_control.text = "CONTROL: TOUCHSCREEN"
	
	elif (TranslationServer.get_locale() == "es"):
		if (edit_control.text == "CONTROL: PANTALLA TÁCTIL"):
			edit_control.text = "CONTROL: ACELEROMETRO"
		elif (edit_control.text == "CONTROL: ACELEROMETRO"):
			edit_control.text = "CONTROL: PANTALLA TÁCTIL"
	
	elif (TranslationServer.get_locale() == "pt"):
		if (edit_control.text == "CONTROLES: TOUCHSCREEN"):
			edit_control.text = "CONTROLO: ACELERÔMETRO"
		elif (edit_control.text == "CONTROLO: ACELERÔMETRO"):
			edit_control.text = "CONTROLO: TOUCHSCREEN"
	
	elif (TranslationServer.get_locale() == "fr"):
		if (edit_control.text == "CONTRÔLE: ÉCRAN TACTILE"):
			edit_control.text = "CONTRÔLE: ACCÉLÉROMÈTRE"
		elif (edit_control.text == "CONTRÔLE: ACCÉLÉROMÈTRE"):
			edit_control.text = "CONTRÔLE: ÉCRAN TACTILE"
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
	elif (sound.get_text() == sound_off_fr):
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
	
	##########################################################################
	
	if (language.get_text() == language_english_eng):
		TranslationServer.set_locale("en")
		preference.language = "EN"
	elif (language.get_text() == language_spanish_es):
		TranslationServer.set_locale("es")
		preference.language = "ES"
	elif (language.get_text() == language_portuguese_pt):
		TranslationServer.set_locale("pt")
		preference.language = "PT"
	elif (language.get_text() == language_french_fr):
		TranslationServer.set_locale("fr")
		preference.language = "FR"
	
	##########################################################################
	
	if (edit_control.text == "CONTROL: TOUCHSCREEN"):
		preference.control = "touchscreen"
	elif (edit_control.text == "CONTROL: ACCELEROMETER"):
		preference.control = "accelerometer"
	
	if (edit_control.text == "CONTROLES: PANTALLA TÁCTIL"):
		preference.control = "touchscreen"
	elif (edit_control.text == "CONTROL: ACELEROMETRO"):
		preference.control = "accelerometer"
	
	if (edit_control.text == "CONTROLES: TOUCHSCREEN"):
		preference.control = "touchscreen"
	elif (edit_control.text == "CONTROLO: ACELERÔMETRO"):
		preference.control = "accelerometer"
	
	if (edit_control.text == "CONTRÔLE: ÉCRAN TACTILE"):
		preference.control = "touchscreen"
	elif (edit_control.text == "CONTRÔLE: ACCÉLÉROMÈTRE"):
		preference.control = "accelerometer"
	
	preference.apply_settings()
	once = false
	get_tree().reload_current_scene()
	pass
