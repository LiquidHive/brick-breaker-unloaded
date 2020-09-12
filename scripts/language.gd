extends Control


onready var sfx_player = utility.sound_fx

onready var language = get_parent().get_node("Settings/Settings/Language")

# Language
onready var english = get_node("English")
onready var spanish = get_node("Spanish")
onready var portuguese = get_node("Portuguese")
onready var french = get_node("French")


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
	# Language
	english.connect("pressed", self, "english")
	spanish.connect("pressed", self, "spanish")
	portuguese.connect("pressed", self, "portuguese")
	french.connect("pressed", self, "french")
	
	english.set_text(language_english_eng)
	spanish.set_text(language_spanish_es)
	portuguese.set_text(language_portuguese_pt)
	french.set_text(language_french_fr)
	pass


func english():
	sfx_player.play()
	TranslationServer.set_locale("en")
	preference.language = "EN"
	preference.sound = true
	preference.music = true
	language.set_text("KEY_ENGLISH")
	preference.apply_settings()
	get_tree().reload_current_scene()
	pass


func spanish():
	sfx_player.play()
	TranslationServer.set_locale("es")
	preference.language = "ES"
	preference.sound = true
	preference.music = true
	language.set_text("KEY_ESPANOL")
	preference.apply_settings()
	get_tree().reload_current_scene()
	pass


func portuguese():
	sfx_player.play()
	TranslationServer.set_locale("pt")
	preference.language = "PT"
	preference.sound = true
	preference.music = true
	language.set_text("KEY_PORTUGUESE")
	preference.apply_settings()
	get_tree().reload_current_scene()
	pass


func french():
	sfx_player.play()
	TranslationServer.set_locale("fr")
	preference.language = "FR"
	preference.sound = true
	preference.music = true
	language.set_text("KEY_FRENCH")
	preference.apply_settings()
	get_tree().reload_current_scene()
	pass
