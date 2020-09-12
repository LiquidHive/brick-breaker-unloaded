extends Node


onready var config = ConfigFile.new()
onready var file = File.new()

var sound
var music
var language = "NULL"

var control = "touchscreen"
var highscore
var lives

var remove_ads

var how_to_play

var stage_1
var stage_2
var stage_3
var stage_4
var stage_5
var extra

var s1_level_1
var s1_level_2
var s1_level_3
var s1_level_4
var s1_level_5
var s1_level_6
var s1_level_7
var s1_level_8
var s1_level_9
var s1_level_10

var s2_level_1
var s2_level_2
var s2_level_3
var s2_level_4
var s2_level_5
var s2_level_6
var s2_level_7
var s2_level_8
var s2_level_9
var s2_level_10

var s3_level_1
var s3_level_2
var s3_level_3
var s3_level_4
var s3_level_5
var s3_level_6
var s3_level_7
var s3_level_8
var s3_level_9
var s3_level_10

var s4_level_1
var s4_level_2
var s4_level_3
var s4_level_4
var s4_level_5
var s4_level_6
var s4_level_7
var s4_level_8
var s4_level_9
var s4_level_10

var s5_level_1
var s5_level_2
var s5_level_3
var s5_level_4
var s5_level_5
var s5_level_6
var s5_level_7
var s5_level_8
var s5_level_9
var s5_level_10

var se_level_1
var se_level_2
var se_level_3
var se_level_4
var se_level_5
var se_level_6
var se_level_7
var se_level_8
var se_level_9
var se_level_10

var file_path = "user://ConfigFile.txt"


func _ready():
	set_pause_mode(2)
	
	if (not file.file_exists(file_path)):
		config.load(file_path)
		
		config.set_value("help", "how_to_play", true)
		
		config.set_value("audio", "sound", true)
		config.set_value("audio", "music", true)
		config.set_value("communication", "language", "null")
		
		config.set_value("controls", "user_input", "touchscreen")
		config.set_value("database", "highscore", 0)
		config.set_value("database", "lives", 3)
		
		config.set_value("monetize", "Ads", true)
		
		##########################################################################
		
		config.set_value("stages", "stage_1", true)
		config.set_value("stages", "stage_2", false)
		config.set_value("stages", "stage_3", false)
		config.set_value("stages", "stage_4", false)
		config.set_value("stages", "stage_5", false)
		config.set_value("stages", "extra", false)
		
		##########################################################################
		
		config.set_value("stage_1", "level_1", true)
		config.set_value("stage_1", "level_2", false)
		config.set_value("stage_1", "level_3", false)
		config.set_value("stage_1", "level_4", false)
		config.set_value("stage_1", "level_5", false)
		config.set_value("stage_1", "level_6", false)
		config.set_value("stage_1", "level_7", false)
		config.set_value("stage_1", "level_8", false)
		config.set_value("stage_1", "level_9", false)
		config.set_value("stage_1", "level_10", false)
		
		##########################################################################
		
		config.set_value("stage_2", "level_1", false)
		config.set_value("stage_2", "level_2", false)
		config.set_value("stage_2", "level_3", false)
		config.set_value("stage_2", "level_4", false)
		config.set_value("stage_2", "level_5", false)
		config.set_value("stage_2", "level_6", false)
		config.set_value("stage_2", "level_7", false)
		config.set_value("stage_2", "level_8", false)
		config.set_value("stage_2", "level_9", false)
		config.set_value("stage_2", "level_10", false)
		
		##########################################################################
		
		config.set_value("stage_3", "level_1", false)
		config.set_value("stage_3", "level_2", false)
		config.set_value("stage_3", "level_3", false)
		config.set_value("stage_3", "level_4", false)
		config.set_value("stage_3", "level_5", false)
		config.set_value("stage_3", "level_6", false)
		config.set_value("stage_3", "level_7", false)
		config.set_value("stage_3", "level_8", false)
		config.set_value("stage_3", "level_9", false)
		config.set_value("stage_3", "level_10", false)
		
		#########################################################################
		
		config.set_value("stage_4", "level_1", false)
		config.set_value("stage_4", "level_2", false)
		config.set_value("stage_4", "level_3", false)
		config.set_value("stage_4", "level_4", false)
		config.set_value("stage_4", "level_5", false)
		config.set_value("stage_4", "level_6", false)
		config.set_value("stage_4", "level_7", false)
		config.set_value("stage_4", "level_8", false)
		config.set_value("stage_4", "level_9", false)
		config.set_value("stage_4", "level_10", false)
		
		#########################################################################
		
		config.set_value("stage_5", "level_1", false)
		config.set_value("stage_5", "level_2", false)
		config.set_value("stage_5", "level_3", false)
		config.set_value("stage_5", "level_4", false)
		config.set_value("stage_5", "level_5", false)
		config.set_value("stage_5", "level_6", false)
		config.set_value("stage_5", "level_7", false)
		config.set_value("stage_5", "level_8", false)
		config.set_value("stage_5", "level_9", false)
		config.set_value("stage_5", "level_10", false)
		
		#########################################################################
		
		config.set_value("stage_e", "level_1", false)
		config.set_value("stage_e", "level_2", false)
		config.set_value("stage_e", "level_3", false)
		config.set_value("stage_e", "level_4", false)
		config.set_value("stage_e", "level_5", false)
		config.set_value("stage_e", "level_6", false)
		config.set_value("stage_e", "level_7", false)
		config.set_value("stage_e", "level_8", false)
		config.set_value("stage_e", "level_9", false)
		config.set_value("stage_e", "level_10", false)
		config.save(file_path)
		get_config()
		apply_settings()
		
	else:
		config.load(file_path)
		
		if (config.get_value("help", "how_to_play") == true):
			how_to_play = true
		elif (config.get_value("help", "how_to_play") == false):
			how_to_play = false
		
		if (config.get_value("audio", "sound") == true):
			sound = true
		elif (config.get_value("audio", "sound") == false):
			sound = false
		
		if (config.get_value("monetize", "Ads") == true):
			remove_ads = false
		elif (config.get_value("monetize", "Ads") == false):
			remove_ads = true
		
		##########################################################################
		
		if (config.get_value("audio", "music") == true):
			music = true
		elif (config.get_value("audio", "music") == false):
			music = false
		
		##########################################################################
		
		if (config.get_value("communication", "language") == "null"):
			language = "NULL"
			TranslationServer.set_locale("en")
		elif (config.get_value("communication", "language") == "en"):
			language = "EN"
			TranslationServer.set_locale("en")
		elif (config.get_value("communication", "language") == "es"):
			language = "ES"
			TranslationServer.set_locale("es")
		elif (config.get_value("communication", "language") == "pt"):
			language = "PT"
			TranslationServer.set_locale("pt")
		elif (config.get_value("communication", "language") == "fr"):
			language = "FR"
			TranslationServer.set_locale("fr")
		
		if (config.get_value("controls", "user_input") == "touchscreen"):
			control = "touchscreen"
		elif (config.get_value("controls", "user_input") == "accelerometer"):
			control = "accelerometer"
		
		highscore = config.get_value("database", "highscore")
		
		lives = config.get_value("database", "lives")
		
		if (config.get_value("stages", "stage_1") == true):
			stage_1 = true
		elif (config.get_value("stages", "stage_1") == false):
			stage_1 = false
		
		if (config.get_value("stages", "stage_2") == true):
			stage_2 = true
		elif (config.get_value("stages", "stage_2") == false):
			stage_2 = false
		
		if (config.get_value("stages", "stage_3") == true):
			stage_3 = true
		elif (config.get_value("stages", "stage_3") == false):
			stage_3 = false
		
		if (config.get_value("stages", "stage_4") == true):
			stage_4 = true
		elif (config.get_value("stages", "stage_4") == false):
			stage_4 = false
		
		if (config.get_value("stages", "stage_5") == true):
			stage_5 = true
		elif (config.get_value("stages", "stage_5") == false):
			stage_5 = false
		
		if (config.get_value("stages", "extra") == true):
			extra = true
		elif (config.get_value("stages", "extra") == false):
			extra = false
		
		##########################################################################
		
		# If stage 1 buttons are lock/unlock
		if (config.get_value("stage_1", "level_1") == true):
			s1_level_1 = true
		elif (config.get_value("stage_1", "level_1") == false):
			s1_level_1 = false

		if (config.get_value("stage_1", "level_2") == true):
			s1_level_2 = true
		elif (config.get_value("stage_1", "level_2") == false):
			s1_level_2 = false
		
		if (config.get_value("stage_1", "level_3") == true):
			s1_level_3 = true
		elif (config.get_value("stage_1", "level_3") == false):
			s1_level_3 = false
		
		if (config.get_value("stage_1", "level_4") == true):
			s1_level_4 = true
		elif (config.get_value("stage_1", "level_4") == false):
			s1_level_4 = false
		
		if (config.get_value("stage_1", "level_5") == true):
			s1_level_5 = true
		elif (config.get_value("stage_1", "level_5") == false):
			s1_level_5 = false
		
		if (config.get_value("stage_1", "level_6") == true):
			s1_level_6 = true
		elif (config.get_value("stage_1", "level_6") == false):
			s1_level_6 = false
		
		if (config.get_value("stage_1", "level_7") == true):
			s1_level_7 = true
		elif (config.get_value("stage_1", "level_7") == false):
			s1_level_7 = false
		
		if (config.get_value("stage_1", "level_8") == true):
			s1_level_8 = true
		elif (config.get_value("stage_1", "level_8") == false):
			s1_level_8 = false
		
		if (config.get_value("stage_1", "level_9") == true):
			s1_level_9 = true
		elif (config.get_value("stage_1", "level_9") == false):
			s1_level_9 = false
		
		if (config.get_value("stage_1", "level_10") == true):
			s1_level_10 = true
		elif (config.get_value("stage_1", "level_10") == false):
			s1_level_10 = false
		
		##########################################################################
		
		# If stage 2 buttons are lock/unlock
		if (config.get_value("stage_2", "level_1") == true):
			s2_level_1 = true
		elif (config.get_value("stage_2", "level_1") == false):
			s2_level_1 = false
		
		if (config.get_value("stage_2", "level_2") == true):
			s2_level_2 = true
		elif (config.get_value("stage_2", "level_2") == false):
			s2_level_2 = false
		
		if (config.get_value("stage_2", "level_3") == true):
			s2_level_3 = true
		elif (config.get_value("stage_2", "level_3") == false):
			s2_level_3 = false
		
		if (config.get_value("stage_2", "level_4") == true):
			s2_level_4 = true
		elif (config.get_value("stage_2", "level_4") == false):
			s2_level_4 = false
		
		if (config.get_value("stage_2", "level_5") == true):
			s2_level_5 = true
		elif (config.get_value("stage_2", "level_5") == false):
			s2_level_5 = false
		
		if (config.get_value("stage_2", "level_6") == true):
			s2_level_6 = true
		elif (config.get_value("stage_2", "level_6") == false):
			s2_level_6 = false
		
		if (config.get_value("stage_2", "level_7") == true):
			s2_level_7 = true
		elif (config.get_value("stage_2", "level_7") == false):
			s2_level_7 = false
		
		if (config.get_value("stage_2", "level_8") == true):
			s2_level_8 = true
		elif (config.get_value("stage_2", "level_8") == false):
			s2_level_8 = false
		
		if (config.get_value("stage_2", "level_9") == true):
			s2_level_9 = true
		elif (config.get_value("stage_2", "level_9") == false):
			s2_level_9 = false
		
		if (config.get_value("stage_2", "level_10") == true):
			s2_level_10 = true
		elif (config.get_value("stage_2", "level_10") == false):
			s2_level_10 = false
		
		##########################################################################
		
		# If stage 3 buttons are lock/unlock
		if (config.get_value("stage_3", "level_1") == true):
			s3_level_1 = true
		elif (config.get_value("stage_3", "level_1") == false):
			s3_level_1 = false
		
		if (config.get_value("stage_3", "level_2") == true):
			s3_level_2 = true
		elif (config.get_value("stage_3", "level_2") == false):
			s3_level_2 = false
		
		if (config.get_value("stage_3", "level_3") == true):
			s3_level_3 = true
		elif (config.get_value("stage_3", "level_3") == false):
			s3_level_3 = false
		
		if (config.get_value("stage_3", "level_4") == true):
			s3_level_4 = true
		elif (config.get_value("stage_3", "level_4") == false):
			s3_level_4 = false
		
		if (config.get_value("stage_3", "level_5") == true):
			s3_level_5 = true
		elif (config.get_value("stage_3", "level_5") == false):
			s3_level_5 = false
		
		if (config.get_value("stage_3", "level_6") == true):
			s3_level_6 = true
		elif (config.get_value("stage_3", "level_6") == false):
			s3_level_6 = false
		
		if (config.get_value("stage_3", "level_7") == true):
			s3_level_7 = true
		elif (config.get_value("stage_3", "level_7") == false):
			s3_level_7 = false
		
		if (config.get_value("stage_3", "level_8") == true):
			s3_level_8 = true
		elif (config.get_value("stage_3", "level_8") == false):
			s3_level_8 = false
		
		if (config.get_value("stage_3", "level_9") == true):
			s3_level_9 = true
		elif (config.get_value("stage_3", "level_9") == false):
			s3_level_9 = false
		
		if (config.get_value("stage_3", "level_10") == true):
			s3_level_10 = true
		elif (config.get_value("stage_3", "level_10") == false):
			s3_level_10 = false
		
		##########################################################################

		# If stage 4 buttons are lock/unlock
		if (config.get_value("stage_4", "level_1") == true):
			s4_level_1 = true
		elif (config.get_value("stage_4", "level_1") == false):
			s4_level_1 = false
		
		if (config.get_value("stage_4", "level_2") == true):
			s4_level_2 = true
		elif (config.get_value("stage_4", "level_2") == false):
			s4_level_2 = false
		
		if (config.get_value("stage_4", "level_3") == true):
			s4_level_3 = true
		elif (config.get_value("stage_4", "level_3") == false):
			s4_level_3 = false
		
		if (config.get_value("stage_4", "level_4") == true):
			s4_level_4 = true
		elif (config.get_value("stage_4", "level_4") == false):
			s4_level_4 = false
		
		if (config.get_value("stage_4", "level_5") == true):
			s4_level_5 = true
		elif (config.get_value("stage_4", "level_5") == false):
			s4_level_5 = false
		
		if (config.get_value("stage_4", "level_6") == true):
			s4_level_6 = true
		elif (config.get_value("stage_4", "level_6") == false):
			s4_level_6 = false
		
		if (config.get_value("stage_4", "level_7") == true):
			s4_level_7 = true
		elif (config.get_value("stage_4", "level_7") == false):
			s4_level_7 = false
		
		if (config.get_value("stage_4", "level_8") == true):
			s4_level_8 = true
		elif (config.get_value("stage_4", "level_8") == false):
			s4_level_8 = false
		
		if (config.get_value("stage_4", "level_9") == true):
			s4_level_9 = true
		elif (config.get_value("stage_4", "level_9") == false):
			s4_level_9 = false
		
		if (config.get_value("stage_4", "level_10") == true):
			s4_level_10 = true
		elif (config.get_value("stage_4", "level_10") == false):
			s4_level_10 = false
		
		##########################################################################
		
		# If stage 5 buttons are lock/unlock
		if (config.get_value("stage_5", "level_1") == true):
			s5_level_1 = true
		elif (config.get_value("stage_5", "level_1") == false):
			s5_level_1 = false
		
		if (config.get_value("stage_5", "level_2") == true):
			s5_level_2 = true
		elif (config.get_value("stage_5", "level_2") == false):
			s5_level_2 = false
		
		if (config.get_value("stage_5", "level_3") == true):
			s5_level_3 = true
		elif (config.get_value("stage_5", "level_3") == false):
			s5_level_3 = false
		
		if (config.get_value("stage_5", "level_4") == true):
			s5_level_4 = true
		elif (config.get_value("stage_5", "level_4") == false):
			s5_level_4 = false
		
		if (config.get_value("stage_5", "level_5") == true):
			s5_level_5 = true
		elif (config.get_value("stage_5", "level_5") == false):
			s5_level_5 = false
		
		if (config.get_value("stage_5", "level_6") == true):
			s5_level_6 = true
		elif (config.get_value("stage_5", "level_6") == false):
			s5_level_6 = false
		
		if (config.get_value("stage_5", "level_7") == true):
			s5_level_7 = true
		elif (config.get_value("stage_5", "level_7") == false):
			s5_level_7 = false
		
		if (config.get_value("stage_5", "level_8") == true):
			s5_level_8 = true
		elif (config.get_value("stage_5", "level_8") == false):
			s5_level_8 = false
		
		if (config.get_value("stage_5", "level_9") == true):
			s5_level_9 = true
		elif (config.get_value("stage_5", "level_9") == false):
			s5_level_9 = false
		
		if (config.get_value("stage_5", "level_10") == true):
			s5_level_10 = true
		elif (config.get_value("stage_5", "level_10") == false):
			s5_level_10 = false
		
		# If stage Extra buttons are lock/unlock
		if (config.get_value("stage_e", "level_1") == true):
			se_level_1 = true
		elif (config.get_value("stage_e", "level_1") == false):
			se_level_1 = false
		
		if (config.get_value("stage_e", "level_2") == true):
			se_level_2 = true
		elif (config.get_value("stage_e", "level_2") == false):
			se_level_2 = false
		
		if (config.get_value("stage_e", "level_3") == true):
			se_level_3 = true
		elif (config.get_value("stage_e", "level_3") == false):
			se_level_3 = false
		
		if (config.get_value("stage_e", "level_4") == true):
			se_level_4 = true
		elif (config.get_value("stage_e", "level_4") == false):
			se_level_4 = false
		
		if (config.get_value("stage_e", "level_5") == true):
			se_level_5 = true
		elif (config.get_value("stage_e", "level_5") == false):
			se_level_5 = false
		
		if (config.get_value("stage_e", "level_6") == true):
			se_level_6 = true
		elif (config.get_value("stage_e", "level_6") == false):
			se_level_6 = false
		
		if (config.get_value("stage_e", "level_7") == true):
			se_level_7 = true
		elif (config.get_value("stage_e", "level_7") == false):
			se_level_7 = false
		
		if (config.get_value("stage_e", "level_8") == true):
			se_level_8 = true
		elif (config.get_value("stage_e", "level_8") == false):
			se_level_8 = false
		
		if (config.get_value("stage_e", "level_9") == true):
			se_level_9 = true
		elif (config.get_value("stage_e", "level_9") == false):
			se_level_9 = false
		
		if (config.get_value("stage_e", "level_10") == true):
			se_level_10 = true
		elif (config.get_value("stage_e", "level_10") == false):
			se_level_10 = false
		apply_settings()
	pass


func check():
	config.load(file_path)
	
	##########################################################################
	
	if (config.get_value("help", "how_to_play") == null):
		how_to_play = true
	
	##########################################################################
	
	if (config.get_value("monetize", "Ads") == null):
		config.set_value("monetize", "Ads", true)
	
	##########################################################################
	
	if (config.get_value("audio", "sound") == null):
		config.set_value("audio", "sound", true)
	
	##########################################################################
	
	if (config.get_value("audio", "music") == null):
		config.set_value("audio", "music", true)
	
	##########################################################################
	
	if (config.get_value("communication", "language") == null):
		config.set_value("communication", "language", "null")
	
	##########################################################################
	
	if (config.get_value("controls", "user_input") == null):
		config.set_value("controls", "user_input", "touchscreen")
	
	if (config.get_value("database", "highscore") == null):
		config.set_value("database", "highscore", 00000)
	
	if (config.get_value("database", "lives") == null):
		config.set_value("database", "lives", 3)
	
	##########################################################################
	
	if (config.get_value("stages", "stage_1") == null):
		config.set_value("stages", "stage_1", true)
	
	if (config.get_value("stages", "stage_2") == null):
		config.set_value("stages", "stage_2", false)
	
	if (config.get_value("stages", "stage_3") == null):
		config.set_value("stages", "stage_3", false)
	
	if (config.get_value("stages", "stage_4") == null):
		config.set_value("stages", "stage_4", false)
	
	if (config.get_value("stages", "stage_5") == null):
		config.set_value("stages", "stage_5", false)
	
	if (config.get_value("stages", "extra") == null):
		config.set_value("stages", "extra", false)
	
	##########################################################################
	
	if (config.get_value("stage_1", "level_1") == null):
		config.set_value("stage_1", "level_1", true)
	
	if (config.get_value("stage_1", "level_2") == null):
		config.set_value("stage_1", "level_2", false)
	
	if (config.get_value("stage_1", "level_3") == null):
		config.set_value("stage_1", "level_3", false)
	
	if (config.get_value("stage_1", "level_4") == null):
		config.set_value("stage_1", "level_4", false)
	
	if (config.get_value("stage_1", "level_5") == null):
		config.set_value("stage_1", "level_5", false)
	
	if (config.get_value("stage_1", "level_6") == null):
		config.set_value("stage_1", "level_6", false)
	
	if (config.get_value("stage_1", "level_7") == null):
		config.set_value("stage_1", "level_7", false)
	
	if (config.get_value("stage_1", "level_8") == null):
		config.set_value("stage_1", "level_8", false)
	
	if (config.get_value("stage_1", "level_9") == null):
		config.set_value("stage_1", "level_9", false)
	
	if (config.get_value("stage_1", "level_10") == null):
		config.set_value("stage_1", "level_10", false)
	
	##########################################################################
	
	if (config.get_value("stage_2", "level_1") == null):
		config.set_value("stage_2", "level_1", true)
	
	if (config.get_value("stage_2", "level_2") == null):
		config.set_value("stage_2", "level_2", false)
	
	if (config.get_value("stage_2", "level_3") == null):
		config.set_value("stage_2", "level_3", false)
	
	if (config.get_value("stage_2", "level_4") == null):
		config.set_value("stage_2", "level_4", false)
	
	if (config.get_value("stage_2", "level_5") == null):
		config.set_value("stage_2", "level_5", false)
	
	if (config.get_value("stage_2", "level_6") == null):
		config.set_value("stage_2", "level_6", false)
	
	if (config.get_value("stage_2", "level_7") == null):
		config.set_value("stage_2", "level_7", false)
	
	if (config.get_value("stage_2", "level_8") == null):
		config.set_value("stage_2", "level_8", false)
	
	if (config.get_value("stage_2", "level_9") == null):
		config.set_value("stage_2", "level_9", false)
	
	if (config.get_value("stage_2", "level_10") == null):
		config.set_value("stage_2", "level_10", false)
	
	##########################################################################
	
	if (config.get_value("stage_3", "level_1") == null):
		config.set_value("stage_3", "level_1", false)
	
	if (config.get_value("stage_3", "level_2") == null):
		config.set_value("stage_3", "level_2", false)
	
	if (config.get_value("stage_3", "level_3") == null):
		config.set_value("stage_3", "level_3", false)
	
	if (config.get_value("stage_3", "level_4") == null):
		config.set_value("stage_3", "level_4", false)
	
	if (config.get_value("stage_3", "level_5") == null):
		config.set_value("stage_3", "level_5", false)
	
	if (config.get_value("stage_3", "level_6") == null):
		config.set_value("stage_3", "level_6", false)
	
	if (config.get_value("stage_3", "level_7") == null):
		config.set_value("stage_3", "level_7", false)
	
	if (config.get_value("stage_3", "level_8") == null):
		config.set_value("stage_3", "level_8", false)
	
	if (config.get_value("stage_3", "level_9") == null):
		config.set_value("stage_3", "level_9", false)
	
	if (config.get_value("stage_3", "level_10") == null):
		config.set_value("stage_3", "level_10", false)
	
	##########################################################################
	
	if (config.get_value("stage_4", "level_1") == null):
		config.set_value("stage_4", "level_1", false)
	
	if (config.get_value("stage_4", "level_2") == null):
		config.set_value("stage_4", "level_2", false)
	
	if (config.get_value("stage_4", "level_3") == null):
		config.set_value("stage_4", "level_3", false)
	
	if (config.get_value("stage_4", "level_4") == null):
		config.set_value("stage_4", "level_4", false)
	
	if (config.get_value("stage_4", "level_5") == null):
		config.set_value("stage_4", "level_5", false)
	
	if (config.get_value("stage_4", "level_6") == null):
		config.set_value("stage_4", "level_6", false)
	
	if (config.get_value("stage_4", "level_7") == null):
		config.set_value("stage_4", "level_7", false)
	
	if (config.get_value("stage_4", "level_8") == null):
		config.set_value("stage_4", "level_8", false)
	
	if (config.get_value("stage_4", "level_9") == null):
		config.set_value("stage_4", "level_9", false)
	
	if (config.get_value("stage_4", "level_10") == null):
		config.set_value("stage_4", "level_10", false)
	
	##########################################################################
	
	if (config.get_value("stage_5", "level_1") == null):
		config.set_value("stage_5", "level_1", false)
	
	if (config.get_value("stage_5", "level_2") == null):
		config.set_value("stage_5", "level_2", false)
	
	if (config.get_value("stage_5", "level_3") == null):
		config.set_value("stage_5", "level_3", false)
	
	if (config.get_value("stage_5", "level_4") == null):
		config.set_value("stage_5", "level_4", false)
	
	if (config.get_value("stage_5", "level_5") == null):
		config.set_value("stage_5", "level_5", false)
	
	if (config.get_value("stage_5", "level_6") == null):
		config.set_value("stage_5", "level_6", false)
	
	if (config.get_value("stage_5", "level_7") == null):
		config.set_value("stage_5", "level_7", false)
	
	if (config.get_value("stage_5", "level_8") == null):
		config.set_value("stage_5", "level_8", false)
	
	if (config.get_value("stage_5", "level_9") == null):
		config.set_value("stage_5", "level_9", false)
	
	if (config.get_value("stage_5", "level_10") == null):
		config.set_value("stage_5", "level_10", false)
	
	##########################################################################
	
	if (config.get_value("stage_e", "level_1") == null):
		config.set_value("stage_e", "level_1", false)
	
	if (config.get_value("stage_e", "level_2") == null):
		config.set_value("stage_e", "level_2", false)
	
	if (config.get_value("stage_e", "level_3") == null):
		config.set_value("stage_e", "level_3", false)
	
	if (config.get_value("stage_e", "level_4") == null):
		config.set_value("stage_e", "level_4", false)
	
	if (config.get_value("stage_e", "level_5") == null):
		config.set_value("stage_e", "level_5", false)
	
	if (config.get_value("stage_e", "level_6") == null):
		config.set_value("stage_e", "level_6", false)
	
	if (config.get_value("stage_e", "level_7") == null):
		config.set_value("stage_e", "level_7", false)
	
	if (config.get_value("stage_e", "level_8") == null):
		config.set_value("stage_e", "level_8", false)
	
	if (config.get_value("stage_e", "level_9") == null):
		config.set_value("stage_e", "level_9", false)
	
	if (config.get_value("stage_e", "level_10") == null):
		config.set_value("stage_e", "level_10", false)
	config.save(file_path)
	pass


func rest_settings(): # Rest the settings back to the default.
	config.load(file_path)
	
	config.set_value("help", "how_to_play", true)
	
	config.set_value("audio", "sound", true)
	config.set_value("audio", "music", true)
	
	config.set_value("controls", "user_input", "touchscreen")
	config.set_value("database", "highscore", 0)
	config.set_value("database", "lives", 3)
	
	##########################################################################
	
	config.set_value("stages", "stage_1", true)
	config.set_value("stages", "stage_2", false)
	config.set_value("stages", "stage_3", false)
	config.set_value("stages", "stage_4", false)
	config.set_value("stages", "stage_5", false)
	config.set_value("stages", "extra", false)
	
	##########################################################################
	
	config.set_value("stage_1", "level_1", true)
	config.set_value("stage_1", "level_2", false)
	config.set_value("stage_1", "level_3", false)
	config.set_value("stage_1", "level_4", false)
	config.set_value("stage_1", "level_5", false)
	config.set_value("stage_1", "level_6", false)
	config.set_value("stage_1", "level_7", false)
	config.set_value("stage_1", "level_8", false)
	config.set_value("stage_1", "level_9", false)
	config.set_value("stage_1", "level_10", false)
	
	##########################################################################
	
	config.set_value("stage_2", "level_1", false)
	config.set_value("stage_2", "level_2", false)
	config.set_value("stage_2", "level_3", false)
	config.set_value("stage_2", "level_4", false)
	config.set_value("stage_2", "level_5", false)
	config.set_value("stage_2", "level_6", false)
	config.set_value("stage_2", "level_7", false)
	config.set_value("stage_2", "level_8", false)
	config.set_value("stage_2", "level_9", false)
	config.set_value("stage_2", "level_10", false)
	
	##########################################################################
	
	config.set_value("stage_3", "level_1", false)
	config.set_value("stage_3", "level_2", false)
	config.set_value("stage_3", "level_3", false)
	config.set_value("stage_3", "level_4", false)
	config.set_value("stage_3", "level_5", false)
	config.set_value("stage_3", "level_6", false)
	config.set_value("stage_3", "level_7", false)
	config.set_value("stage_3", "level_8", false)
	config.set_value("stage_3", "level_9", false)
	config.set_value("stage_3", "level_10", false)
	
	#########################################################################
	
	config.set_value("stage_4", "level_1", false)
	config.set_value("stage_4", "level_2", false)
	config.set_value("stage_4", "level_3", false)
	config.set_value("stage_4", "level_4", false)
	config.set_value("stage_4", "level_5", false)
	config.set_value("stage_4", "level_6", false)
	config.set_value("stage_4", "level_7", false)
	config.set_value("stage_4", "level_8", false)
	config.set_value("stage_4", "level_9", false)
	config.set_value("stage_4", "level_10", false)
	
	#########################################################################
	
	config.set_value("stage_5", "level_1", false)
	config.set_value("stage_5", "level_2", false)
	config.set_value("stage_5", "level_3", false)
	config.set_value("stage_5", "level_4", false)
	config.set_value("stage_5", "level_5", false)
	config.set_value("stage_5", "level_6", false)
	config.set_value("stage_5", "level_7", false)
	config.set_value("stage_5", "level_8", false)
	config.set_value("stage_5", "level_9", false)
	config.set_value("stage_5", "level_10", false)
	
	#########################################################################
	
	config.set_value("stage_e", "level_1", false)
	config.set_value("stage_e", "level_2", false)
	config.set_value("stage_e", "level_3", false)
	config.set_value("stage_e", "level_4", false)
	config.set_value("stage_e", "level_5", false)
	config.set_value("stage_e", "level_6", false)
	config.set_value("stage_e", "level_7", false)
	config.set_value("stage_e", "level_8", false)
	config.set_value("stage_e", "level_9", false)
	config.set_value("stage_e", "level_10", false)
	
	config.save(file_path)
	pass


func apply_settings(): # Gets the settings from the cofig file.
	config.load(file_path)
	
	if (how_to_play == true):
		config.set_value("help", "how_to_play", true)
	elif (how_to_play == false):
		config.set_value("help", "how_to_play", false)
	
	if (remove_ads == true):
		config.set_value("monetize", "Ads", false)
	elif (remove_ads == false):
		config.set_value("monetize", "Ads", true)
	
	if ((get_tree().get_current_scene().get_name() == "Intro") || (get_tree().get_current_scene().get_name() == "LoadingScreen")):
		if (utility.music.is_playing()):
			utility.music.stop()
			AudioServer.set_bus_mute(1, false)
	else:
		if (sound == true):
			AudioServer.set_bus_mute(2, false)
			config.set_value("audio", "sound", true)
		elif (sound == false):
			AudioServer.set_bus_mute(2, true)
			config.set_value("audio", "sound", false)
		
		if (music == true):
			if (not utility.music.is_playing()):
				utility.play()
				AudioServer.set_bus_mute(1, false)
				config.set_value("audio", "music", true)
		elif (music == false):
			utility.music.stop()
			AudioServer.set_bus_mute(1, true)
			config.set_value("audio", "music", false)
	
	if (language == "EN"):
		TranslationServer.set_locale("en")
		config.set_value("communication", "language", "en")
	elif (language == "ES"):
		TranslationServer.set_locale("es")
		config.set_value("communication", "language", "es")
	elif (language == "PT"):
		TranslationServer.set_locale("pt")
		config.set_value("communication", "language", "pt")
	elif (language == "FR"):
		TranslationServer.set_locale("fr")
		config.set_value("communication", "language", "fr")
		language = "FR"
	
	if (control == "touchscreen"):
		config.set_value("controls", "user_input", "touchscreen")
		control = "touchscreen"
	elif (control == "accelerometer"):
		config.set_value("controls", "user_input", "accelerometer")
		control = "accelerometer"
	
	config.set_value("database", "highscore", highscore)
	config.set_value("database", "lives", lives)
	
	config.save(file_path)
	pass


func get_config(): # From config file to settings.
	config.load(file_path)
	
	if (config.get_value("help", "how_to_play") == true):
		how_to_play = true
	elif (config.get_value("help", "how_to_play") == false):
		how_to_play = false
	
	if (config.get_value("monetize", "Ads") == true):
		remove_ads = false
	elif (config.get_value("monetize", "Ads") == false):
		remove_ads = true
	
	if (config.get_value("audio", "sound") == true):
		sound = true
	elif (config.get_value("audio", "sound") == false):
		sound = false
	
	##########################################################################
	
	if (config.get_value("audio", "music") == true):
		music = true
	elif (config.get_value("audio", "music") == false):
		music = false
	
	##########################################################################
	
	if (config.get_value("communication", "language") == "null"):
		language = "NULL"
		TranslationServer.set_locale("en")
	elif (config.get_value("communication", "language") == "en"):
		language = "EN"
		TranslationServer.set_locale("en")
	elif (config.get_value("communication", "language") == "es"):
		language = "ES"
		TranslationServer.set_locale("es")
	elif (config.get_value("communication", "language") == "pt"):
		language = "PT"
		TranslationServer.set_locale("pt")
	elif (config.get_value("communication", "language") == "fr"):
		language = "FR"
		TranslationServer.set_locale("fr")
	
	##########################################################################
	
	if (config.get_value("controls", "user_input") == "touchscreen"):
		control = "touchscreen"
	elif (config.get_value("controls", "user_input") == "accelerometer"):
		control = "accelerometer"
	
	highscore = config.get_value("database", "highscore")
	lives = config.get_value("database", "lives")
	
	##########################################################################
	
	if (config.get_value("stages", "stage_1") == true):
		stage_1 = true
	elif (config.get_value("stages", "stage_1") == false):
		stage_1 = false
	
	if (config.get_value("stages", "stage_2") == true):
		stage_2 = true
	elif (config.get_value("stages", "stage_2") == false):
		stage_2 = false
	
	if (config.get_value("stages", "stage_3") == true):
		stage_3 = true
	elif (config.get_value("stages", "stage_3") == false):
		stage_3 = false
	
	if (config.get_value("stages", "stage_4") == true):
		stage_4 = true
	elif (config.get_value("stages", "stage_4") == false):
		stage_4 = false
	
	if (config.get_value("stages", "stage_5") == true):
		stage_5 = true
	elif (config.get_value("stages", "stage_5") == false):
		stage_5 = false
	
	if (config.get_value("stages", "extra") == true):
		extra = true
	elif (config.get_value("stages", "extra") == false):
		extra = false
	
	##########################################################################
	
	# If stage 1 buttons are lock/unlock
	if (config.get_value("stage_1", "level_1") == true):
		s1_level_1 = true
	elif (config.get_value("stage_1", "level_1") == false):
		s1_level_1 = false

	if (config.get_value("stage_1", "level_2") == true):
		s1_level_2 = true
	elif (config.get_value("stage_1", "level_2") == false):
		s1_level_2 = false
	
	if (config.get_value("stage_1", "level_3") == true):
		s1_level_3 = true
	elif (config.get_value("stage_1", "level_3") == false):
		s1_level_3 = false
	
	if (config.get_value("stage_1", "level_4") == true):
		s1_level_4 = true
	elif (config.get_value("stage_1", "level_4") == false):
		s1_level_4 = false
	
	if (config.get_value("stage_1", "level_5") == true):
		s1_level_5 = true
	elif (config.get_value("stage_1", "level_5") == false):
		s1_level_5 = false
	
	if (config.get_value("stage_1", "level_6") == true):
		s1_level_6 = true
	elif (config.get_value("stage_1", "level_6") == false):
		s1_level_6 = false
	
	if (config.get_value("stage_1", "level_7") == true):
		s1_level_7 = true
	elif (config.get_value("stage_1", "level_7") == false):
		s1_level_7 = false
	
	if (config.get_value("stage_1", "level_8") == true):
		s1_level_8 = true
	elif (config.get_value("stage_1", "level_8") == false):
		s1_level_8 = false
	
	if (config.get_value("stage_1", "level_9") == true):
		s1_level_9 = true
	elif (config.get_value("stage_1", "level_9") == false):
		s1_level_9 = false
	
	if (config.get_value("stage_1", "level_10") == true):
		s1_level_10 = true
	elif (config.get_value("stage_1", "level_10") == false):
		s1_level_10 = false
	
	##########################################################################
	
	# If stage 2 buttons are lock/unlock
	if (config.get_value("stage_2", "level_1") == true):
		s2_level_1 = true
	elif (config.get_value("stage_2", "level_1") == false):
		s2_level_1 = false
	
	if (config.get_value("stage_2", "level_2") == true):
		s2_level_2 = true
	elif (config.get_value("stage_2", "level_2") == false):
		s2_level_2 = false
	
	if (config.get_value("stage_2", "level_3") == true):
		s2_level_3 = true
	elif (config.get_value("stage_2", "level_3") == false):
		s2_level_3 = false
	
	if (config.get_value("stage_2", "level_4") == true):
		s2_level_4 = true
	elif (config.get_value("stage_2", "level_4") == false):
		s2_level_4 = false
	
	if (config.get_value("stage_2", "level_5") == true):
		s2_level_5 = true
	elif (config.get_value("stage_2", "level_5") == false):
		s2_level_5 = false
	
	if (config.get_value("stage_2", "level_6") == true):
		s2_level_6 = true
	elif (config.get_value("stage_2", "level_6") == false):
		s2_level_6 = false
	
	if (config.get_value("stage_2", "level_7") == true):
		s2_level_7 = true
	elif (config.get_value("stage_2", "level_7") == false):
		s2_level_7 = false
	
	if (config.get_value("stage_2", "level_8") == true):
		s2_level_8 = true
	elif (config.get_value("stage_2", "level_8") == false):
		s2_level_8 = false
	
	if (config.get_value("stage_2", "level_9") == true):
		s2_level_9 = true
	elif (config.get_value("stage_2", "level_9") == false):
		s2_level_9 = false
	
	if (config.get_value("stage_2", "level_10") == true):
		s2_level_10 = true
	elif (config.get_value("stage_2", "level_10") == false):
		s2_level_10 = false
	
	##########################################################################
	
	# If stage 3 buttons are lock/unlock
	if (config.get_value("stage_3", "level_1") == true):
		s3_level_1 = true
	elif (config.get_value("stage_3", "level_1") == false):
		s3_level_1 = false
	
	if (config.get_value("stage_3", "level_2") == true):
		s3_level_2 = true
	elif (config.get_value("stage_3", "level_2") == false):
		s3_level_2 = false
	
	if (config.get_value("stage_3", "level_3") == true):
		s3_level_3 = true
	elif (config.get_value("stage_3", "level_3") == false):
		s3_level_3 = false
	
	if (config.get_value("stage_3", "level_4") == true):
		s3_level_4 = true
	elif (config.get_value("stage_3", "level_4") == false):
		s3_level_4 = false
	
	if (config.get_value("stage_3", "level_5") == true):
		s3_level_5 = true
	elif (config.get_value("stage_3", "level_5") == false):
		s3_level_5 = false
	
	if (config.get_value("stage_3", "level_6") == true):
		s3_level_6 = true
	elif (config.get_value("stage_3", "level_6") == false):
		s3_level_6 = false
	
	if (config.get_value("stage_3", "level_7") == true):
		s3_level_7 = true
	elif (config.get_value("stage_3", "level_7") == false):
		s3_level_7 = false
	
	if (config.get_value("stage_3", "level_8") == true):
		s3_level_8 = true
	elif (config.get_value("stage_3", "level_8") == false):
		s3_level_8 = false
	
	if (config.get_value("stage_3", "level_9") == true):
		s3_level_9 = true
	elif (config.get_value("stage_3", "level_9") == false):
		s3_level_9 = false
	
	if (config.get_value("stage_3", "level_10") == true):
		s3_level_10 = true
	elif (config.get_value("stage_3", "level_10") == false):
		s3_level_10 = false
	
	##########################################################################

	# If stage 4 buttons are lock/unlock
	if (config.get_value("stage_4", "level_1") == true):
		s4_level_1 = true
	elif (config.get_value("stage_4", "level_1") == false):
		s4_level_1 = false
	
	if (config.get_value("stage_4", "level_2") == true):
		s4_level_2 = true
	elif (config.get_value("stage_4", "level_2") == false):
		s4_level_2 = false
	
	if (config.get_value("stage_4", "level_3") == true):
		s4_level_3 = true
	elif (config.get_value("stage_4", "level_3") == false):
		s4_level_3 = false
	
	if (config.get_value("stage_4", "level_4") == true):
		s4_level_4 = true
	elif (config.get_value("stage_4", "level_4") == false):
		s4_level_4 = false
	
	if (config.get_value("stage_4", "level_5") == true):
		s4_level_5 = true
	elif (config.get_value("stage_4", "level_5") == false):
		s4_level_5 = false
	
	if (config.get_value("stage_4", "level_6") == true):
		s4_level_6 = true
	elif (config.get_value("stage_4", "level_6") == false):
		s4_level_6 = false
	
	if (config.get_value("stage_4", "level_7") == true):
		s4_level_7 = true
	elif (config.get_value("stage_4", "level_7") == false):
		s4_level_7 = false
	
	if (config.get_value("stage_4", "level_8") == true):
		s4_level_8 = true
	elif (config.get_value("stage_4", "level_8") == false):
		s4_level_8 = false
	
	if (config.get_value("stage_4", "level_9") == true):
		s4_level_9 = true
	elif (config.get_value("stage_4", "level_9") == false):
		s4_level_9 = false
	
	if (config.get_value("stage_4", "level_10") == true):
		s4_level_10 = true
	elif (config.get_value("stage_4", "level_10") == false):
		s4_level_10 = false
	
	##########################################################################
	
	# If stage 5 buttons are lock/unlock
	if (config.get_value("stage_5", "level_1") == true):
		s5_level_1 = true
	elif (config.get_value("stage_5", "level_1") == false):
		s5_level_1 = false
	
	if (config.get_value("stage_5", "level_2") == true):
		s5_level_2 = true
	elif (config.get_value("stage_5", "level_2") == false):
		s5_level_2 = false
	
	if (config.get_value("stage_5", "level_3") == true):
		s5_level_3 = true
	elif (config.get_value("stage_5", "level_3") == false):
		s5_level_3 = false
	
	if (config.get_value("stage_5", "level_4") == true):
		s5_level_4 = true
	elif (config.get_value("stage_5", "level_4") == false):
		s5_level_4 = false
	
	if (config.get_value("stage_5", "level_5") == true):
		s5_level_5 = true
	elif (config.get_value("stage_5", "level_5") == false):
		s5_level_5 = false
	
	if (config.get_value("stage_5", "level_6") == true):
		s5_level_6 = true
	elif (config.get_value("stage_5", "level_6") == false):
		s5_level_6 = false
	
	if (config.get_value("stage_5", "level_7") == true):
		s5_level_7 = true
	elif (config.get_value("stage_5", "level_7") == false):
		s5_level_7 = false
	
	if (config.get_value("stage_5", "level_8") == true):
		s5_level_8 = true
	elif (config.get_value("stage_5", "level_8") == false):
		s5_level_8 = false
	
	if (config.get_value("stage_5", "level_9") == true):
		s5_level_9 = true
	elif (config.get_value("stage_5", "level_9") == false):
		s5_level_9 = false
	
	if (config.get_value("stage_5", "level_10") == true):
		s5_level_10 = true
	elif (config.get_value("stage_5", "level_10") == false):
		s5_level_10 = false
	
	# If stage Extra buttons are lock/unlock
	if (config.get_value("stage_e", "level_1") == true):
		se_level_1 = true
	elif (config.get_value("stage_e", "level_1") == false):
		se_level_1 = false
	
	if (config.get_value("stage_e", "level_2") == true):
		se_level_2 = true
	elif (config.get_value("stage_e", "level_2") == false):
		se_level_2 = false
	
	if (config.get_value("stage_e", "level_3") == true):
		se_level_3 = true
	elif (config.get_value("stage_e", "level_3") == false):
		se_level_3 = false
	
	if (config.get_value("stage_e", "level_4") == true):
		se_level_4 = true
	elif (config.get_value("stage_e", "level_4") == false):
		se_level_4 = false
	
	if (config.get_value("stage_e", "level_5") == true):
		se_level_5 = true
	elif (config.get_value("stage_e", "level_5") == false):
		se_level_5 = false
	
	if (config.get_value("stage_e", "level_6") == true):
		se_level_6 = true
	elif (config.get_value("stage_e", "level_6") == false):
		se_level_6 = false
	
	if (config.get_value("stage_e", "level_7") == true):
		se_level_7 = true
	elif (config.get_value("stage_e", "level_7") == false):
		se_level_7 = false
	
	if (config.get_value("stage_e", "level_8") == true):
		se_level_8 = true
	elif (config.get_value("stage_e", "level_8") == false):
		se_level_8 = false
	
	if (config.get_value("stage_e", "level_9") == true):
		se_level_9 = true
	elif (config.get_value("stage_e", "level_9") == false):
		se_level_9 = false
	
	if (config.get_value("stage_e", "level_10") == true):
		se_level_10 = true
	elif (config.get_value("stage_e", "level_10") == false):
		se_level_10 = false
	pass
