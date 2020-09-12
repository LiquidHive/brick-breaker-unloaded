extends Node


var lock_large = preload("res://assets/svgs/hud/icons/lock_large.svg")
var stars_0 = preload("res://assets/svgs/hud/icons/stars_background.svg")
var stars_0_5 = preload("res://assets/svgs/hud/icons/stars_0.5.svg")
var stars_1 = preload("res://assets/svgs/hud/icons/stars_1.svg")
var stars_1_5 = preload("res://assets/svgs/hud/icons/stars_1.5.svg")
var stars_2 = preload("res://assets/svgs/hud/icons/stars_2.svg")
var stars_2_5 = preload("res://assets/svgs/hud/icons/stars_2.5.svg")
var stars_3 = preload("res://assets/svgs/hud/icons/stars_3.svg")

var stage
var run_once = false

onready var sfx_player = utility.sound_fx

onready var sub_title = get_node("UI/SubTitle")

# Roots
onready var stages_root = get_node("UI/Stages")
onready var play_root = get_node("UI/Play")
onready var multiplayer_root = get_node("UI/Multiplayer")
onready var stage_1_root = get_node("UI/Levels/Stage 1")
onready var stage_2_root = get_node("UI/Levels/Stage 2")
onready var stage_3_root = get_node("UI/Levels/Stage 3")
onready var stage_4_root = get_node("UI/Levels/Stage 4")
onready var stage_5_root = get_node("UI/Levels/Stage 5")
onready var extra_root = get_node("UI/Levels/Extra")

onready var adventure = play_root.get_node("Adventure")
#onready var multiplayer = play_root.get_node("Multiplayer")

# Stage buttons
onready var stage_1 = stages_root.get_node("Stage 1")
onready var stage_2 = stages_root.get_node("Stage 2")
onready var stage_3 = stages_root.get_node("Stage 3")
onready var stage_4 = stages_root.get_node("Stage 4")
onready var stage_5 = stages_root.get_node("Stage 5")
onready var extra = stages_root.get_node("Extra")

onready var stage_1_label = stage_1.get_node("Label")
onready var stage_2_label = stage_2.get_node("Label")
onready var stage_3_label = stage_3.get_node("Label")
onready var stage_4_label = stage_4.get_node("Label")
onready var stage_5_label = stage_5.get_node("Label")
onready var stage_e_label = extra.get_node("Label")

onready var stage_1_lock = stage_1.get_node("Sprite")
onready var stage_2_lock = stage_2.get_node("Sprite")
onready var stage_3_lock = stage_3.get_node("Sprite")
onready var stage_4_lock = stage_4.get_node("Sprite")
onready var stage_5_lock = stage_5.get_node("Sprite")
onready var stage_e_lock = extra.get_node("Sprite")

# Stage 1 buttons
onready var s1_level_1 = stage_1_root.get_node("Level 1")
onready var s1_level_2 = stage_1_root.get_node("Level 2")
onready var s1_level_3 = stage_1_root.get_node("Level 3")
onready var s1_level_4 = stage_1_root.get_node("Level 4")
onready var s1_level_5 = stage_1_root.get_node("Level 5")
onready var s1_level_6 = stage_1_root.get_node("Level 6")
onready var s1_level_7 = stage_1_root.get_node("Level 7")
onready var s1_level_8 = stage_1_root.get_node("Level 8")
onready var s1_level_9 = stage_1_root.get_node("Level 9")
onready var s1_level_10 = stage_1_root.get_node("Level 10")

onready var s1_back = stage_1_root.get_node("Back")

# Stage 2 buttons
onready var s2_level_1 = stage_2_root.get_node("Level 1")
onready var s2_level_2 = stage_2_root.get_node("Level 2")
onready var s2_level_3 = stage_2_root.get_node("Level 3")
onready var s2_level_4 = stage_2_root.get_node("Level 4")
onready var s2_level_5 = stage_2_root.get_node("Level 5")
onready var s2_level_6 = stage_2_root.get_node("Level 6")
onready var s2_level_7 = stage_2_root.get_node("Level 7")
onready var s2_level_8 = stage_2_root.get_node("Level 8")
onready var s2_level_9 = stage_2_root.get_node("Level 9")
onready var s2_level_10 = stage_2_root.get_node("Level 10")

onready var s2_back = stage_2_root.get_node("Back")

# Stage 3 buttons
onready var s3_level_1 = stage_3_root.get_node("Level 1")
onready var s3_level_2 = stage_3_root.get_node("Level 2")
onready var s3_level_3 = stage_3_root.get_node("Level 3")
onready var s3_level_4 = stage_3_root.get_node("Level 4")
onready var s3_level_5 = stage_3_root.get_node("Level 5")
onready var s3_level_6 = stage_3_root.get_node("Level 6")
onready var s3_level_7 = stage_3_root.get_node("Level 7")
onready var s3_level_8 = stage_3_root.get_node("Level 8")
onready var s3_level_9 = stage_3_root.get_node("Level 9")
onready var s3_level_10 = stage_3_root.get_node("Level 10")

onready var s3_back = stage_3_root.get_node("Back")

# Stage 4 buttons
onready var s4_level_1 = stage_4_root.get_node("Level 1")
onready var s4_level_2 = stage_4_root.get_node("Level 2")
onready var s4_level_3 = stage_4_root.get_node("Level 3")
onready var s4_level_4 = stage_4_root.get_node("Level 4")
onready var s4_level_5 = stage_4_root.get_node("Level 5")
onready var s4_level_6 = stage_4_root.get_node("Level 6")
onready var s4_level_7 = stage_4_root.get_node("Level 7")
onready var s4_level_8 = stage_4_root.get_node("Level 8")
onready var s4_level_9 = stage_4_root.get_node("Level 9")
onready var s4_level_10 = stage_4_root.get_node("Level 10")

onready var s4_back = stage_4_root.get_node("Back")

# Stage 5 buttons
onready var s5_level_1 = stage_5_root.get_node("Level 1")
onready var s5_level_2 = stage_5_root.get_node("Level 2")
onready var s5_level_3 = stage_5_root.get_node("Level 3")
onready var s5_level_4 = stage_5_root.get_node("Level 4")
onready var s5_level_5 = stage_5_root.get_node("Level 5")
onready var s5_level_6 = stage_5_root.get_node("Level 6")
onready var s5_level_7 = stage_5_root.get_node("Level 7")
onready var s5_level_8 = stage_5_root.get_node("Level 8")
onready var s5_level_9 = stage_5_root.get_node("Level 9")
onready var s5_level_10 = stage_5_root.get_node("Level 10")

onready var s5_back = stage_5_root.get_node("Back")

# Stage Extra buttons
onready var se_level_1 = extra_root.get_node("Level 1")
onready var se_level_2 = extra_root.get_node("Level 2")
onready var se_level_3 = extra_root.get_node("Level 3")
onready var se_level_4 = extra_root.get_node("Level 4")
onready var se_level_5 = extra_root.get_node("Level 5")
onready var se_level_6 = extra_root.get_node("Level 6")
onready var se_level_7 = extra_root.get_node("Level 7")
onready var se_level_8 = extra_root.get_node("Level 8")
onready var se_level_9 = extra_root.get_node("Level 9")
onready var se_level_10 = extra_root.get_node("Level 10")

onready var se_back = extra_root.get_node("Back")

# Labels for stage 1
onready var s1_level_1_label = s1_level_1.get_node("Label")
onready var s1_level_2_label = s1_level_2.get_node("Label")
onready var s1_level_3_label = s1_level_3.get_node("Label")
onready var s1_level_4_label = s1_level_4.get_node("Label")
onready var s1_level_5_label = s1_level_5.get_node("Label")
onready var s1_level_6_label = s1_level_6.get_node("Label")
onready var s1_level_7_label = s1_level_7.get_node("Label")
onready var s1_level_8_label = s1_level_8.get_node("Label")
onready var s1_level_9_label = s1_level_9.get_node("Label")
onready var s1_level_10_label = s1_level_10.get_node("Label")

# Labels for stage 2
onready var s2_level_1_label = s2_level_1.get_node("Label")
onready var s2_level_2_label = s2_level_2.get_node("Label")
onready var s2_level_3_label = s2_level_3.get_node("Label")
onready var s2_level_4_label = s2_level_4.get_node("Label")
onready var s2_level_5_label = s2_level_5.get_node("Label")
onready var s2_level_6_label = s2_level_6.get_node("Label")
onready var s2_level_7_label = s2_level_7.get_node("Label")
onready var s2_level_8_label = s2_level_8.get_node("Label")
onready var s2_level_9_label = s2_level_9.get_node("Label")
onready var s2_level_10_label = s2_level_10.get_node("Label")

# Labels for stage 3
onready var s3_level_1_label = s3_level_1.get_node("Label")
onready var s3_level_2_label = s3_level_2.get_node("Label")
onready var s3_level_3_label = s3_level_3.get_node("Label")
onready var s3_level_4_label = s3_level_4.get_node("Label")
onready var s3_level_5_label = s3_level_5.get_node("Label")
onready var s3_level_6_label = s3_level_6.get_node("Label")
onready var s3_level_7_label = s3_level_7.get_node("Label")
onready var s3_level_8_label = s3_level_8.get_node("Label")
onready var s3_level_9_label = s3_level_9.get_node("Label")
onready var s3_level_10_label = s3_level_10.get_node("Label")

# Labels for stage 4
onready var s4_level_1_label = s4_level_1.get_node("Label")
onready var s4_level_2_label = s4_level_2.get_node("Label")
onready var s4_level_3_label = s4_level_3.get_node("Label")
onready var s4_level_4_label = s4_level_4.get_node("Label")
onready var s4_level_5_label = s4_level_5.get_node("Label")
onready var s4_level_6_label = s4_level_6.get_node("Label")
onready var s4_level_7_label = s4_level_7.get_node("Label")
onready var s4_level_8_label = s4_level_8.get_node("Label")
onready var s4_level_9_label = s4_level_9.get_node("Label")
onready var s4_level_10_label = s4_level_10.get_node("Label")

# Labels for stage 5
onready var s5_level_1_label = s5_level_1.get_node("Label")
onready var s5_level_2_label = s5_level_2.get_node("Label")
onready var s5_level_3_label = s5_level_3.get_node("Label")
onready var s5_level_4_label = s5_level_4.get_node("Label")
onready var s5_level_5_label = s5_level_5.get_node("Label")
onready var s5_level_6_label = s5_level_6.get_node("Label")
onready var s5_level_7_label = s5_level_7.get_node("Label")
onready var s5_level_8_label = s5_level_8.get_node("Label")
onready var s5_level_9_label = s5_level_9.get_node("Label")
onready var s5_level_10_label = s5_level_10.get_node("Label")

# Labels for stage e
onready var se_level_1_label = se_level_1.get_node("Label")
onready var se_level_2_label = se_level_2.get_node("Label")
onready var se_level_3_label = se_level_3.get_node("Label")
onready var se_level_4_label = se_level_4.get_node("Label")
onready var se_level_5_label = se_level_5.get_node("Label")
onready var se_level_6_label = se_level_6.get_node("Label")
onready var se_level_7_label = se_level_7.get_node("Label")
onready var se_level_8_label = se_level_8.get_node("Label")
onready var se_level_9_label = se_level_9.get_node("Label")
onready var se_level_10_label = se_level_10.get_node("Label")

onready var play_back = play_root.get_node("Back")
onready var stages_back = stages_root.get_node("Back")
onready var multiplayer_back = multiplayer_root.get_node("Back")

onready var s1_level_1_sprite = s1_level_1.get_node("Sprite")
onready var s1_level_2_sprite = s1_level_2.get_node("Sprite")
onready var s1_level_3_sprite = s1_level_3.get_node("Sprite")
onready var s1_level_4_sprite = s1_level_4.get_node("Sprite")
onready var s1_level_5_sprite = s1_level_5.get_node("Sprite")
onready var s1_level_6_sprite = s1_level_6.get_node("Sprite")
onready var s1_level_7_sprite = s1_level_7.get_node("Sprite")
onready var s1_level_8_sprite = s1_level_8.get_node("Sprite")
onready var s1_level_9_sprite = s1_level_9.get_node("Sprite")
onready var s1_level_10_sprite = s1_level_10.get_node("Sprite")

onready var s2_level_1_sprite = s2_level_1.get_node("Sprite")
onready var s2_level_2_sprite = s2_level_2.get_node("Sprite")
onready var s2_level_3_sprite = s2_level_3.get_node("Sprite")
onready var s2_level_4_sprite = s2_level_4.get_node("Sprite")
onready var s2_level_5_sprite = s2_level_5.get_node("Sprite")
onready var s2_level_6_sprite = s2_level_6.get_node("Sprite")
onready var s2_level_7_sprite = s2_level_7.get_node("Sprite")
onready var s2_level_8_sprite = s2_level_8.get_node("Sprite")
onready var s2_level_9_sprite = s2_level_9.get_node("Sprite")
onready var s2_level_10_sprite = s2_level_10.get_node("Sprite")

onready var s3_level_1_sprite = s3_level_1.get_node("Sprite")
onready var s3_level_2_sprite = s3_level_2.get_node("Sprite")
onready var s3_level_3_sprite = s3_level_3.get_node("Sprite")
onready var s3_level_4_sprite = s3_level_4.get_node("Sprite")
onready var s3_level_5_sprite = s3_level_5.get_node("Sprite")
onready var s3_level_6_sprite = s3_level_6.get_node("Sprite")
onready var s3_level_7_sprite = s3_level_7.get_node("Sprite")
onready var s3_level_8_sprite = s3_level_8.get_node("Sprite")
onready var s3_level_9_sprite = s3_level_9.get_node("Sprite")
onready var s3_level_10_sprite = s3_level_10.get_node("Sprite")

onready var s4_level_1_sprite = s4_level_1.get_node("Sprite")
onready var s4_level_2_sprite = s4_level_2.get_node("Sprite")
onready var s4_level_3_sprite = s4_level_3.get_node("Sprite")
onready var s4_level_4_sprite = s4_level_4.get_node("Sprite")
onready var s4_level_5_sprite = s4_level_5.get_node("Sprite")
onready var s4_level_6_sprite = s4_level_6.get_node("Sprite")
onready var s4_level_7_sprite = s4_level_7.get_node("Sprite")
onready var s4_level_8_sprite = s4_level_8.get_node("Sprite")
onready var s4_level_9_sprite = s4_level_9.get_node("Sprite")
onready var s4_level_10_sprite = s4_level_10.get_node("Sprite")

onready var s5_level_1_sprite = s5_level_1.get_node("Sprite")
onready var s5_level_2_sprite = s5_level_2.get_node("Sprite")
onready var s5_level_3_sprite = s5_level_3.get_node("Sprite")
onready var s5_level_4_sprite = s5_level_4.get_node("Sprite")
onready var s5_level_5_sprite = s5_level_5.get_node("Sprite")
onready var s5_level_6_sprite = s5_level_6.get_node("Sprite")
onready var s5_level_7_sprite = s5_level_7.get_node("Sprite")
onready var s5_level_8_sprite = s5_level_8.get_node("Sprite")
onready var s5_level_9_sprite = s5_level_9.get_node("Sprite")
onready var s5_level_10_sprite = s5_level_10.get_node("Sprite")

onready var se_level_1_sprite = se_level_1.get_node("Sprite")
onready var se_level_2_sprite = se_level_2.get_node("Sprite")
onready var se_level_3_sprite = se_level_3.get_node("Sprite")
onready var se_level_4_sprite = se_level_4.get_node("Sprite")
onready var se_level_5_sprite = se_level_5.get_node("Sprite")
onready var se_level_6_sprite = se_level_6.get_node("Sprite")
onready var se_level_7_sprite = se_level_7.get_node("Sprite")
onready var se_level_8_sprite = se_level_8.get_node("Sprite")
onready var se_level_9_sprite = se_level_9.get_node("Sprite")
onready var se_level_10_sprite = se_level_10.get_node("Sprite")


func _ready():
	set_process(true)
	
	play_back.connect("pressed", self, "back_to_main")
	stages_back.connect("pressed", self, "back_to_main")
	multiplayer_back.connect("pressed", self, "back_to_play")
	
	sub_title.set_text("STRING_STAGE_SEL")
	selector.scene = "Stages"
	selector.state = "Stages"
	selector.once = false
	
	preference.get_config()
	
#	sub_title.set_text("STRING_PLAY")
#	selector.scene = "Select"
#	selector.state = "Select"
#	selector.once = false
	
	adventure.connect("pressed", self, "adventure")
#	multiplayer.connect("pressed", self, "multiplayer")
	
	
	##########################################################################
	
	if (preference.stage_1 == false):
		stage_1.set_disabled(true)
		stage_1_label.hide()
		stage_1_lock.show()
	elif (preference.stage_1 == true):
		stage_1.set_disabled(false)
		stage_1_label.show()
		stage_1_lock.hide()
	
	if (preference.stage_2 == false):
		stage_2.set_disabled(true)
		stage_2_label.hide()
		stage_2_lock.show()
	elif (preference.stage_2 == true):
		stage_2.set_disabled(false)
		stage_2_label.show()
		stage_2_lock.hide()
	
	if (preference.stage_3 == false):
		stage_3.set_disabled(true)
		stage_3_label.hide()
		stage_3_lock.show()
	elif (preference.stage_4 == true):
		stage_3.set_disabled(false)
		stage_3_label.show()
		stage_3_lock.hide()
	
	if (preference.stage_4 == false):
		stage_4.set_disabled(true)
		stage_4_label.hide()
		stage_4_lock.show()
	elif (preference.stage_4 == true):
		stage_4.set_disabled(false)
		stage_4_label.show()
		stage_4_lock.hide()
	
	if (preference.stage_5 == false):
		stage_5.set_disabled(true)
		stage_5_label.hide()
		stage_5_lock.show()
	elif (preference.stage_5 == true):
		stage_5.set_disabled(false)
		stage_5_label.show()
		stage_5_lock.hide()
	
	if (preference.extra  == false):
		extra.set_disabled(true)
		stage_e_label.hide()
		stage_e_lock.show()
	elif (preference.extra == true):
		extra.set_disabled(false)
		stage_e_label.show()
		stage_e_lock.hide()
	
	##########################################################################
	
	# This is for the levels in stage 1
	if (preference.s1_level_1 == false):
		s1_level_1.set_disabled(true)
		s1_level_1_sprite.hide()
		s1_level_1_label.hide()
		s1_level_1.get_node("Lock").show()
	elif (preference.s1_level_1 == true):
		if (preference.s1_level_1_stars == 0):
			s1_level_1_sprite.set_texture(stars_0)
		elif (preference.s1_level_1_stars == 0.5):
			s1_level_1_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_1_stars == 1):
			s1_level_1_sprite.set_texture(stars_1)
		elif (preference.s1_level_1_stars == 1.5):
			s1_level_1_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_1_stars == 2):
			s1_level_1_sprite.set_texture(stars_2)
		elif (preference.s1_level_1_stars == 2.5):
			s1_level_1_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_1_stars == 3):
			s1_level_1_sprite.set_texture(stars_3)
		
		s1_level_1.set_disabled(false)
		s1_level_1_sprite.show()
		s1_level_1_label.show()
		s1_level_1.get_node("Lock").hide()
	
	if (preference.s1_level_2 == false):
		s1_level_2.set_disabled(true)
		s1_level_2_sprite.hide()
		s1_level_2_label.hide()
		s1_level_2.get_node("Lock").show()
	elif (preference.s1_level_2 == true):
		if (preference.s1_level_2_stars == 0):
			s1_level_2_sprite.set_texture(stars_0)
		elif (preference.s1_level_2_stars == 0.5):
			s1_level_2_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_2_stars == 1):
			s1_level_2_sprite.set_texture(stars_1)
		elif (preference.s1_level_2_stars == 1.5):
			s1_level_2_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_2_stars == 2):
			s1_level_2_sprite.set_texture(stars_2)
		elif (preference.s1_level_2_stars == 2.5):
			s1_level_2_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_2_stars == 3):
			s1_level_2_sprite.set_texture(stars_3)
		
		s1_level_2.set_disabled(false)
		s1_level_2_sprite.show()
		s1_level_2_label.show()
		s1_level_2.get_node("Lock").hide()
	
	if (preference.s1_level_3 == false):
		s1_level_3.set_disabled(true)
		s1_level_3_sprite.hide()
		s1_level_3_label.hide()
		s1_level_3.get_node("Lock").show()
	elif (preference.s1_level_3 == true):
		if (preference.s1_level_3_stars == 0):
			s1_level_3_sprite.set_texture(stars_0)
		elif (preference.s1_level_3_stars == 0.5):
			s1_level_3_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_3_stars == 1):
			s1_level_3_sprite.set_texture(stars_1)
		elif (preference.s1_level_3_stars == 1.5):
			s1_level_3_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_3_stars == 2):
			s1_level_3_sprite.set_texture(stars_2)
		elif (preference.s1_level_3_stars == 2.5):
			s1_level_3_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_3_stars == 3):
			s1_level_3_sprite.set_texture(stars_3)
		
		s1_level_3.set_disabled(false)
		s1_level_3_sprite.show()
		s1_level_3_label.show()
		s1_level_3.get_node("Lock").hide()
	
	if (preference.s1_level_4 == false):
		s1_level_4.set_disabled(true)
		s1_level_4_sprite.hide()
		s1_level_4_label.hide()
		s1_level_4.get_node("Lock").show()
	elif (preference.s1_level_4 == true):
		if (preference.s1_level_4_stars == 0):
			s1_level_4_sprite.set_texture(stars_0)
		elif (preference.s1_level_4_stars == 0.5):
			s1_level_4_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_4_stars == 1):
			s1_level_4_sprite.set_texture(stars_1)
		elif (preference.s1_level_4_stars == 1.5):
			s1_level_4_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_4_stars == 2):
			s1_level_4_sprite.set_texture(stars_2)
		elif (preference.s1_level_4_stars == 2.5):
			s1_level_4_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_4_stars == 3):
			s1_level_4_sprite.set_texture(stars_3)
		
		s1_level_4.set_disabled(false)
		s1_level_4_sprite.show()
		s1_level_4_label.show()
		s1_level_4.get_node("Lock").hide()
	
	if (preference.s1_level_5 == false):
		s1_level_5.set_disabled(true)
		s1_level_5_sprite.hide()
		s1_level_5_label.hide()
		s1_level_5.get_node("Lock").show()
	elif (preference.s1_level_5 == true):
		if (preference.s1_level_5_stars == 0):
			s1_level_5_sprite.set_texture(stars_0)
		elif (preference.s1_level_5_stars == 0.5):
			s1_level_5_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_5_stars == 1):
			s1_level_5_sprite.set_texture(stars_1)
		elif (preference.s1_level_5_stars == 1.5):
			s1_level_5_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_5_stars == 2):
			s1_level_5_sprite.set_texture(stars_2)
		elif (preference.s1_level_5_stars == 2.5):
			s1_level_5_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_5_stars == 3):
			s1_level_5_sprite.set_texture(stars_3)
		
		s1_level_5.set_disabled(false)
		s1_level_5_sprite.show()
		s1_level_5_label.show()
		s1_level_5.get_node("Lock").hide()
	
	if (preference.s1_level_6 == false):
		s1_level_6.set_disabled(true)
		s1_level_6_sprite.hide()
		s1_level_6_label.hide()
		s1_level_6.get_node("Lock").show()
	elif (preference.s1_level_6 == true):
		if (preference.s1_level_6_stars == 0):
			s1_level_6_sprite.set_texture(stars_0)
		elif (preference.s1_level_6_stars == 0.5):
			s1_level_6_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_6_stars == 1):
			s1_level_6_sprite.set_texture(stars_1)
		elif (preference.s1_level_6_stars == 1.5):
			s1_level_6_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_6_stars == 2):
			s1_level_6_sprite.set_texture(stars_2)
		elif (preference.s1_level_6_stars == 2.5):
			s1_level_6_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_6_stars == 3):
			s1_level_6_sprite.set_texture(stars_3)
		
		s1_level_6.set_disabled(false)
		s1_level_6_sprite.show()
		s1_level_6_label.show()
		s1_level_6.get_node("Lock").hide()
	
	if (preference.s1_level_7 == false):
		s1_level_7.set_disabled(true)
		s1_level_7_sprite.hide()
		s1_level_7_label.hide()
		s1_level_7.get_node("Lock").show()
	elif (preference.s1_level_7 == true):
		if (preference.s1_level_7_stars == 0):
			s1_level_7_sprite.set_texture(stars_0)
		elif (preference.s1_level_7_stars == 0.5):
			s1_level_7_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_7_stars == 1):
			s1_level_7_sprite.set_texture(stars_1)
		elif (preference.s1_level_7_stars == 1.5):
			s1_level_7_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_7_stars == 2):
			s1_level_7_sprite.set_texture(stars_2)
		elif (preference.s1_level_7_stars == 2.5):
			s1_level_7_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_7_stars == 3):
			s1_level_7_sprite.set_texture(stars_3)
		
		s1_level_7.set_disabled(false)
		s1_level_7_sprite.show()
		s1_level_7_label.show()
		s1_level_7.get_node("Lock").hide()
	
	if (preference.s1_level_8 == false):
		s1_level_8.set_disabled(true)
		s1_level_8_sprite.hide()
		s1_level_8_label.hide()
		s1_level_8.get_node("Lock").show()
	elif (preference.s1_level_8 == true):
		if (preference.s1_level_8_stars == 0):
			s1_level_8_sprite.set_texture(stars_0)
		elif (preference.s1_level_8_stars == 0.5):
			s1_level_8_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_8_stars == 1):
			s1_level_8_sprite.set_texture(stars_1)
		elif (preference.s1_level_8_stars == 1.5):
			s1_level_8_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_8_stars == 2):
			s1_level_8_sprite.set_texture(stars_2)
		elif (preference.s1_level_8_stars == 2.5):
			s1_level_8_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_8_stars == 3):
			s1_level_8_sprite.set_texture(stars_3)
		
		s1_level_8.set_disabled(false)
		s1_level_8_sprite.show()
		s1_level_8_label.show()
		s1_level_8.get_node("Lock").hide()
	
	if (preference.s1_level_9 == false):
		s1_level_9.set_disabled(true)
		s1_level_9_sprite.hide()
		s1_level_9_label.hide()
		s1_level_9.get_node("Lock").show()
	elif (preference.s1_level_9 == true):
		if (preference.s1_level_9_stars == 0):
			s1_level_9_sprite.set_texture(stars_0)
		elif (preference.s1_level_9_stars == 0.5):
			s1_level_9_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_9_stars == 1):
			s1_level_9_sprite.set_texture(stars_1)
		elif (preference.s1_level_9_stars == 1.5):
			s1_level_9_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_9_stars == 2):
			s1_level_9_sprite.set_texture(stars_2)
		elif (preference.s1_level_9_stars == 2.5):
			s1_level_9_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_9_stars == 3):
			s1_level_9_sprite.set_texture(stars_3)
		
		s1_level_9.set_disabled(false)
		s1_level_9_sprite.show()
		s1_level_9_label.show()
		s1_level_9.get_node("Lock").hide()
	
	if (preference.s1_level_10 == false):
		s1_level_10.set_disabled(true)
		s1_level_10_sprite.hide()
		s1_level_10_label.hide()
		s1_level_10.get_node("Lock").show()
	elif (preference.s1_level_10 == true):
		if (preference.s1_level_10_stars == 0):
			s1_level_10_sprite.set_texture(stars_0)
		elif (preference.s1_level_10_stars == 0.5):
			s1_level_10_sprite.set_texture(stars_0_5)
		elif (preference.s1_level_10_stars == 1):
			s1_level_10_sprite.set_texture(stars_1)
		elif (preference.s1_level_10_stars == 1.5):
			s1_level_10_sprite.set_texture(stars_1_5)
		elif (preference.s1_level_10_stars == 2):
			s1_level_10_sprite.set_texture(stars_2)
		elif (preference.s1_level_10_stars == 2.5):
			s1_level_10_sprite.set_texture(stars_2_5)
		elif (preference.s1_level_10_stars == 3):
			s1_level_10_sprite.set_texture(stars_3)
		
		s1_level_10.set_disabled(false)
		s1_level_10_sprite.show()
		s1_level_10_label.show()
		s1_level_10.get_node("Lock").hide()
	
	##########################################################################
	
	# This is for the levels in stage 2
	if (preference.s2_level_1 == false):
		s2_level_1.set_disabled(true)
		s2_level_1_sprite.hide()
		s2_level_1_label.hide()
		s2_level_1.get_node("Lock").show()
	elif (preference.s2_level_1 == true):
		if (preference.s2_level_1_stars == 0):
			s2_level_1_sprite.set_texture(stars_0)
		elif (preference.s2_level_1_stars == 0.5):
			s2_level_1_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_1_stars == 1):
			s2_level_1_sprite.set_texture(stars_1)
		elif (preference.s2_level_1_stars == 1.5):
			s2_level_1_sprite.set_texture(stars_1_5)
		elif (preference.s2_level_1_stars == 2):
			s2_level_1_sprite.set_texture(stars_2)
		elif (preference.s2_level_1_stars == 2.5):
			s2_level_1_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_1_stars == 3):
			s2_level_1_sprite.set_texture(stars_3)
		
		s2_level_1.set_disabled(false)
		s2_level_1_sprite.show()
		s2_level_1_label.show()
		s2_level_1.get_node("Lock").hide()
	
	if (preference.s2_level_2 == false):
		s2_level_2.set_disabled(true)
		s2_level_2_sprite.hide()
		s2_level_2_label.hide()
		s2_level_2.get_node("Lock").show()
	elif (preference.s2_level_2 == true):
		if (preference.s2_level_2_stars == 0):
			s2_level_2_sprite.set_texture(stars_0)
		elif (preference.s2_level_2_stars == 0.5):
			s2_level_2_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_2_stars == 1):
			s2_level_2_sprite.set_texture(stars_2)
		elif (preference.s2_level_2_stars == 1.5):
			s2_level_2_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_2_stars == 2):
			s2_level_2_sprite.set_texture(stars_2)
		elif (preference.s2_level_2_stars == 2.5):
			s2_level_2_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_2_stars == 3):
			s2_level_2_sprite.set_texture(stars_3)
		
		s2_level_2.set_disabled(false)
		s2_level_2_sprite.show()
		s2_level_2_label.show()
		s2_level_2.get_node("Lock").hide()
	
	if (preference.s2_level_3 == false):
		s2_level_3.set_disabled(true)
		s2_level_3_sprite.hide()
		s2_level_3_label.hide()
		s2_level_3.get_node("Lock").show()
	elif (preference.s2_level_3 == true):
		if (preference.s2_level_3_stars == 0):
			s2_level_3_sprite.set_texture(stars_0)
		elif (preference.s2_level_3_stars == 0.5):
			s2_level_3_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_3_stars == 1):
			s2_level_3_sprite.set_texture(stars_2)
		elif (preference.s2_level_3_stars == 1.5):
			s2_level_3_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_3_stars == 2):
			s2_level_3_sprite.set_texture(stars_2)
		elif (preference.s2_level_3_stars == 2.5):
			s2_level_3_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_3_stars == 3):
			s2_level_3_sprite.set_texture(stars_3)
		
		s2_level_3.set_disabled(false)
		s2_level_3_sprite.show()
		s2_level_3_label.show()
		s2_level_3.get_node("Lock").hide()
	
	if (preference.s2_level_4 == false):
		s2_level_4.set_disabled(true)
		s2_level_4_sprite.hide()
		s2_level_4_label.hide()
		s2_level_4.get_node("Lock").show()
	elif (preference.s2_level_4 == true):
		if (preference.s2_level_4_stars == 0):
			s2_level_4_sprite.set_texture(stars_0)
		elif (preference.s2_level_4_stars == 0.5):
			s2_level_4_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_4_stars == 1):
			s2_level_4_sprite.set_texture(stars_2)
		elif (preference.s2_level_4_stars == 1.5):
			s2_level_4_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_4_stars == 2):
			s2_level_4_sprite.set_texture(stars_2)
		elif (preference.s2_level_4_stars == 2.5):
			s2_level_4_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_4_stars == 3):
			s2_level_4_sprite.set_texture(stars_3)
		
		s2_level_4.set_disabled(false)
		s2_level_4_sprite.show()
		s2_level_4_label.show()
		s2_level_4.get_node("Lock").hide()
	
	if (preference.s2_level_5 == false):
		s2_level_5.set_disabled(true)
		s2_level_5_sprite.hide()
		s2_level_5_label.hide()
		s2_level_5.get_node("Lock").show()
	elif (preference.s2_level_5 == true):
		if (preference.s2_level_5_stars == 0):
			s2_level_5_sprite.set_texture(stars_0)
		elif (preference.s2_level_5_stars == 0.5):
			s2_level_5_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_5_stars == 1):
			s2_level_5_sprite.set_texture(stars_2)
		elif (preference.s2_level_5_stars == 1.5):
			s2_level_5_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_5_stars == 2):
			s2_level_5_sprite.set_texture(stars_2)
		elif (preference.s2_level_5_stars == 2.5):
			s2_level_5_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_5_stars == 3):
			s2_level_5_sprite.set_texture(stars_3)
		
		s2_level_5.set_disabled(false)
		s2_level_5_sprite.show()
		s2_level_5_label.show()
		s2_level_5.get_node("Lock").hide()
	
	if (preference.s2_level_6 == false):
		s2_level_6.set_disabled(true)
		s2_level_6_sprite.hide()
		s2_level_6_label.hide()
		s2_level_6.get_node("Lock").show()
	elif (preference.s2_level_6 == true):
		if (preference.s2_level_6_stars == 0):
			s2_level_6_sprite.set_texture(stars_0)
		elif (preference.s2_level_6_stars == 0.5):
			s2_level_6_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_6_stars == 1):
			s2_level_6_sprite.set_texture(stars_2)
		elif (preference.s2_level_6_stars == 1.5):
			s2_level_6_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_6_stars == 2):
			s2_level_6_sprite.set_texture(stars_2)
		elif (preference.s2_level_6_stars == 2.5):
			s2_level_6_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_6_stars == 3):
			s2_level_6_sprite.set_texture(stars_3)
		
		s2_level_6.set_disabled(false)
		s2_level_6_sprite.show()
		s2_level_6_label.show()
		s2_level_6.get_node("Lock").hide()
	
	if (preference.s2_level_7 == false):
		s2_level_7.set_disabled(true)
		s2_level_7_sprite.hide()
		s2_level_7_label.hide()
		s2_level_7.get_node("Lock").show()
	elif (preference.s2_level_7 == true):
		if (preference.s2_level_7_stars == 0):
			s2_level_7_sprite.set_texture(stars_0)
		elif (preference.s2_level_7_stars == 0.5):
			s2_level_7_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_7_stars == 1):
			s2_level_7_sprite.set_texture(stars_2)
		elif (preference.s2_level_7_stars == 1.5):
			s2_level_7_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_7_stars == 2):
			s2_level_7_sprite.set_texture(stars_2)
		elif (preference.s2_level_7_stars == 2.5):
			s2_level_7_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_7_stars == 3):
			s2_level_7_sprite.set_texture(stars_3)
		
		s2_level_7.set_disabled(false)
		s2_level_7_sprite.show()
		s2_level_7_label.show()
		s2_level_7.get_node("Lock").hide()
	
	if (preference.s2_level_8 == false):
		s2_level_8.set_disabled(true)
		s2_level_8_sprite.hide()
		s2_level_8_label.hide()
		s2_level_8.get_node("Lock").show()
	elif (preference.s2_level_8 == true):
		if (preference.s2_level_8_stars == 0):
			s2_level_8_sprite.set_texture(stars_0)
		elif (preference.s2_level_8_stars == 0.5):
			s2_level_8_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_8_stars == 1):
			s2_level_8_sprite.set_texture(stars_2)
		elif (preference.s2_level_8_stars == 1.5):
			s2_level_8_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_8_stars == 2):
			s2_level_8_sprite.set_texture(stars_2)
		elif (preference.s2_level_8_stars == 2.5):
			s2_level_8_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_8_stars == 3):
			s2_level_8_sprite.set_texture(stars_3)
		
		s2_level_8.set_disabled(false)
		s2_level_8_sprite.show()
		s2_level_8_label.show()
		s2_level_8.get_node("Lock").hide()
	
	if (preference.s2_level_9 == false):
		s2_level_9.set_disabled(true)
		s2_level_9_sprite.hide()
		s2_level_9_label.hide()
		s2_level_9.get_node("Lock").show()
	elif (preference.s2_level_9 == true):
		if (preference.s2_level_9_stars == 0):
			s2_level_9_sprite.set_texture(stars_0)
		elif (preference.s2_level_9_stars == 0.5):
			s2_level_9_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_9_stars == 1):
			s2_level_9_sprite.set_texture(stars_2)
		elif (preference.s2_level_9_stars == 1.5):
			s2_level_9_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_9_stars == 2):
			s2_level_9_sprite.set_texture(stars_2)
		elif (preference.s2_level_9_stars == 2.5):
			s2_level_9_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_9_stars == 3):
			s2_level_9_sprite.set_texture(stars_3)
		
		s2_level_9.set_disabled(false)
		s2_level_9_sprite.show()
		s2_level_9_label.show()
		s2_level_9.get_node("Lock").hide()
	
	if (preference.s2_level_10 == false):
		s2_level_10.set_disabled(true)
		s2_level_10_sprite.hide()
		s2_level_10_label.hide()
		s2_level_10.get_node("Lock").show()
	elif (preference.s2_level_10 == true):
		if (preference.s2_level_10_stars == 0):
			s2_level_10_sprite.set_texture(stars_0)
		elif (preference.s2_level_10_stars == 0.5):
			s2_level_10_sprite.set_texture(stars_0_5)
		elif (preference.s2_level_10_stars == 1):
			s2_level_10_sprite.set_texture(stars_2)
		elif (preference.s2_level_10_stars == 1.5):
			s2_level_10_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_10_stars == 2):
			s2_level_10_sprite.set_texture(stars_2)
		elif (preference.s2_level_10_stars == 2.5):
			s2_level_10_sprite.set_texture(stars_2_5)
		elif (preference.s2_level_10_stars == 3):
			s2_level_10_sprite.set_texture(stars_3)
		
		s2_level_10.set_disabled(false)
		s2_level_10_sprite.show()
		s2_level_10_label.show()
		s2_level_10.get_node("Lock").hide()
	
	##########################################################################
	
	# This is for the levels in stage 3
	if (preference.s3_level_1 == false):
		s3_level_1.set_disabled(true)
		s3_level_1_sprite.hide()
		s3_level_1_label.hide()
		s3_level_1.get_node("Lock").show()
	elif (preference.s3_level_1 == true):
		if (preference.s3_level_1_stars == 0):
			s3_level_1_sprite.set_texture(stars_0)
		elif (preference.s3_level_1_stars == 0.5):
			s3_level_1_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_1_stars == 2):
			s3_level_1_sprite.set_texture(stars_2)
		elif (preference.s3_level_1_stars == 2.5):
			s3_level_1_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_1_stars == 2):
			s3_level_1_sprite.set_texture(stars_2)
		elif (preference.s3_level_1_stars == 2.5):
			s3_level_1_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_1_stars == 3):
			s3_level_1_sprite.set_texture(stars_3)
		
		s3_level_1.set_disabled(false)
		s3_level_1_sprite.show()
		s3_level_1_label.show()
		s3_level_1.get_node("Lock").hide()
	
	if (preference.s3_level_2 == false):
		s3_level_2.set_disabled(true)
		s3_level_2_sprite.hide()
		s3_level_2_label.hide()
		s3_level_2.get_node("Lock").show()
	elif (preference.s3_level_2 == true):
		if (preference.s3_level_2_stars == 0):
			s3_level_2_sprite.set_texture(stars_0)
		elif (preference.s3_level_2_stars == 0.5):
			s3_level_2_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_2_stars == 1):
			s3_level_2_sprite.set_texture(stars_2)
		elif (preference.s3_level_2_stars == 1.5):
			s3_level_2_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_2_stars == 2):
			s3_level_2_sprite.set_texture(stars_2)
		elif (preference.s3_level_2_stars == 2.5):
			s3_level_2_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_2_stars == 3):
			s3_level_2_sprite.set_texture(stars_3)
		
		s3_level_2.set_disabled(false)
		s3_level_2_sprite.show()
		s3_level_2_label.show()
		s3_level_2.get_node("Lock").hide()
	
	if (preference.s3_level_3 == false):
		s3_level_3.set_disabled(true)
		s3_level_3_sprite.hide()
		s3_level_3_label.hide()
		s3_level_3.get_node("Lock").show()
	elif (preference.s3_level_3 == true):
		if (preference.s3_level_3_stars == 0):
			s3_level_3_sprite.set_texture(stars_0)
		elif (preference.s3_level_3_stars == 0.5):
			s3_level_3_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_3_stars == 1):
			s3_level_3_sprite.set_texture(stars_2)
		elif (preference.s3_level_3_stars == 1.5):
			s3_level_3_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_3_stars == 2):
			s3_level_3_sprite.set_texture(stars_2)
		elif (preference.s3_level_3_stars == 2.5):
			s3_level_3_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_3_stars == 3):
			s3_level_3_sprite.set_texture(stars_3)
		
		s3_level_3.set_disabled(false)
		s3_level_3_sprite.show()
		s3_level_3_label.show()
		s3_level_3.get_node("Lock").hide()
	
	if (preference.s3_level_4 == false):
		s3_level_4.set_disabled(true)
		s3_level_4_sprite.hide()
		s3_level_4_label.hide()
		s3_level_4.get_node("Lock").show()
	elif (preference.s3_level_4 == true):
		if (preference.s3_level_4_stars == 0):
			s3_level_4_sprite.set_texture(stars_0)
		elif (preference.s3_level_4_stars == 0.5):
			s3_level_4_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_4_stars == 1):
			s3_level_4_sprite.set_texture(stars_2)
		elif (preference.s3_level_4_stars == 1.5):
			s3_level_4_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_4_stars == 2):
			s3_level_4_sprite.set_texture(stars_2)
		elif (preference.s3_level_4_stars == 2.5):
			s3_level_4_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_4_stars == 3):
			s3_level_4_sprite.set_texture(stars_3)
		
		s3_level_4.set_disabled(false)
		s3_level_4_sprite.show()
		s3_level_4_label.show()
		s3_level_4.get_node("Lock").hide()
	
	if (preference.s3_level_5 == false):
		s3_level_5.set_disabled(true)
		s3_level_5_sprite.hide()
		s3_level_5_label.hide()
		s3_level_5.get_node("Lock").show()
	elif (preference.s3_level_5 == true):
		if (preference.s3_level_5_stars == 0):
			s3_level_5_sprite.set_texture(stars_0)
		elif (preference.s3_level_5_stars == 0.5):
			s3_level_5_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_5_stars == 1):
			s3_level_5_sprite.set_texture(stars_2)
		elif (preference.s3_level_5_stars == 1.5):
			s3_level_5_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_5_stars == 2):
			s3_level_5_sprite.set_texture(stars_2)
		elif (preference.s3_level_5_stars == 2.5):
			s3_level_5_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_5_stars == 3):
			s3_level_5_sprite.set_texture(stars_3)
		
		s3_level_5.set_disabled(false)
		s3_level_5_sprite.show()
		s3_level_5_label.show()
		s3_level_5.get_node("Lock").hide()
	
	if (preference.s3_level_6 == false):
		s3_level_6.set_disabled(true)
		s3_level_6_sprite.hide()
		s3_level_6_label.hide()
		s3_level_6.get_node("Lock").show()
	elif (preference.s3_level_6 == true):
		if (preference.s3_level_6_stars == 0):
			s3_level_6_sprite.set_texture(stars_0)
		elif (preference.s3_level_6_stars == 0.5):
			s3_level_6_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_6_stars == 1):
			s3_level_6_sprite.set_texture(stars_2)
		elif (preference.s3_level_6_stars == 1.5):
			s3_level_6_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_6_stars == 2):
			s3_level_6_sprite.set_texture(stars_2)
		elif (preference.s3_level_6_stars == 2.5):
			s3_level_6_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_6_stars == 3):
			s3_level_6_sprite.set_texture(stars_3)
		
		s3_level_6.set_disabled(false)
		s3_level_6_sprite.show()
		s3_level_6_label.show()
		s3_level_6.get_node("Lock").hide()
	
	if (preference.s3_level_7 == false):
		s3_level_7.set_disabled(true)
		s3_level_7_sprite.hide()
		s3_level_7_label.hide()
		s3_level_7.get_node("Lock").show()
	elif (preference.s3_level_7 == true):
		if (preference.s3_level_7_stars == 0):
			s3_level_7_sprite.set_texture(stars_0)
		elif (preference.s3_level_7_stars == 0.5):
			s3_level_7_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_7_stars == 1):
			s3_level_7_sprite.set_texture(stars_2)
		elif (preference.s3_level_7_stars == 1.5):
			s3_level_7_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_7_stars == 2):
			s3_level_7_sprite.set_texture(stars_2)
		elif (preference.s3_level_7_stars == 2.5):
			s3_level_7_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_7_stars == 3):
			s3_level_7_sprite.set_texture(stars_3)
		
		s3_level_7.set_disabled(false)
		s3_level_7_sprite.show()
		s3_level_7_label.show()
		s3_level_7.get_node("Lock").hide()
	
	if (preference.s3_level_8 == false):
		s3_level_8.set_disabled(true)
		s3_level_8_sprite.hide()
		s3_level_8_label.hide()
		s3_level_8.get_node("Lock").show()
	elif (preference.s3_level_8 == true):
		if (preference.s3_level_8_stars == 0):
			s3_level_8_sprite.set_texture(stars_0)
		elif (preference.s3_level_8_stars == 0.5):
			s3_level_8_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_8_stars == 1):
			s3_level_8_sprite.set_texture(stars_2)
		elif (preference.s3_level_8_stars == 1.5):
			s3_level_8_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_8_stars == 2):
			s3_level_8_sprite.set_texture(stars_2)
		elif (preference.s3_level_8_stars == 2.5):
			s3_level_8_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_8_stars == 3):
			s3_level_8_sprite.set_texture(stars_3)
		
		s3_level_8.set_disabled(false)
		s3_level_8_sprite.show()
		s3_level_8_label.show()
		s3_level_8.get_node("Lock").hide()
	
	if (preference.s3_level_9 == false):
		s3_level_9.set_disabled(true)
		s3_level_9_sprite.hide()
		s3_level_9_label.hide()
		s3_level_9.get_node("Lock").show()
	elif (preference.s3_level_9 == true):
		if (preference.s3_level_9_stars == 0):
			s3_level_9_sprite.set_texture(stars_0)
		elif (preference.s3_level_9_stars == 0.5):
			s3_level_9_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_9_stars == 1):
			s3_level_9_sprite.set_texture(stars_2)
		elif (preference.s3_level_9_stars == 1.5):
			s3_level_9_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_9_stars == 2):
			s3_level_9_sprite.set_texture(stars_2)
		elif (preference.s3_level_9_stars == 2.5):
			s3_level_9_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_9_stars == 3):
			s3_level_9_sprite.set_texture(stars_3)
		
		s3_level_9.set_disabled(false)
		s3_level_9_sprite.show()
		s3_level_9_label.show()
		s3_level_9.get_node("Lock").hide()
	
	if (preference.s3_level_10 == false):
		s3_level_10.set_disabled(true)
		s3_level_10_sprite.hide()
		s3_level_10_label.hide()
		s3_level_10.get_node("Lock").show()
	elif (preference.s3_level_10 == true):
		if (preference.s3_level_10_stars == 0):
			s3_level_10_sprite.set_texture(stars_0)
		elif (preference.s3_level_10_stars == 0.5):
			s3_level_10_sprite.set_texture(stars_0_5)
		elif (preference.s3_level_10_stars == 1):
			s3_level_10_sprite.set_texture(stars_2)
		elif (preference.s3_level_10_stars == 1.5):
			s3_level_10_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_10_stars == 2):
			s3_level_10_sprite.set_texture(stars_2)
		elif (preference.s3_level_10_stars == 2.5):
			s3_level_10_sprite.set_texture(stars_2_5)
		elif (preference.s3_level_10_stars == 3):
			s3_level_10_sprite.set_texture(stars_3)
		
		s3_level_10.set_disabled(false)
		s3_level_10_sprite.show()
		s3_level_10_label.show()
		s3_level_10.get_node("Lock").hide()
	
	##########################################################################
	
	# This is for the levels in stage 4
	if (preference.s4_level_1 == false):
		s4_level_1.set_disabled(true)
		s4_level_1_sprite.hide()
		s4_level_1_label.hide()
		s4_level_1.get_node("Lock").show()
	elif (preference.s4_level_1 == true):
		if (preference.s4_level_1_stars == 0):
			s4_level_1_sprite.set_texture(stars_0)
		elif (preference.s4_level_1_stars == 0.5):
			s4_level_1_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_1_stars == 1):
			s4_level_1_sprite.set_texture(stars_2)
		elif (preference.s4_level_1_stars == 1.5):
			s4_level_1_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_1_stars == 2):
			s4_level_1_sprite.set_texture(stars_2)
		elif (preference.s4_level_1_stars == 2.5):
			s4_level_1_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_1_stars == 3):
			s4_level_1_sprite.set_texture(stars_3)
		
		s4_level_1.set_disabled(false)
		s4_level_1_sprite.show()
		s4_level_1_label.show()
		s4_level_1.get_node("Lock").hide()
	
	if (preference.s4_level_2 == false):
		s4_level_2.set_disabled(true)
		s4_level_2_sprite.hide()
		s4_level_2_label.hide()
		s4_level_2.get_node("Lock").show()
	elif (preference.s4_level_2 == true):
		if (preference.s4_level_2_stars == 0):
			s4_level_2_sprite.set_texture(stars_0)
		elif (preference.s4_level_2_stars == 0.5):
			s4_level_2_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_2_stars == 1):
			s4_level_2_sprite.set_texture(stars_2)
		elif (preference.s4_level_2_stars == 1.5):
			s4_level_2_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_2_stars == 2):
			s4_level_2_sprite.set_texture(stars_2)
		elif (preference.s4_level_2_stars == 2.5):
			s4_level_2_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_2_stars == 3):
			s4_level_2_sprite.set_texture(stars_3)
		
		s4_level_2.set_disabled(false)
		s4_level_2_sprite.show()
		s4_level_2_label.show()
		s4_level_2.get_node("Lock").hide()
	
	if (preference.s4_level_3 == false):
		s4_level_3.set_disabled(true)
		s4_level_3_sprite.hide()
		s4_level_3_label.hide()
		s4_level_3.get_node("Lock").show()
	elif (preference.s4_level_3 == true):
		if (preference.s4_level_3_stars == 0):
			s4_level_3_sprite.set_texture(stars_0)
		elif (preference.s4_level_3_stars == 0.5):
			s4_level_3_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_3_stars == 1):
			s4_level_3_sprite.set_texture(stars_2)
		elif (preference.s4_level_3_stars == 1.5):
			s4_level_3_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_3_stars == 2):
			s4_level_3_sprite.set_texture(stars_2)
		elif (preference.s4_level_3_stars == 2.5):
			s4_level_3_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_3_stars == 3):
			s4_level_3_sprite.set_texture(stars_3)
		
		s4_level_3.set_disabled(false)
		s4_level_3_sprite.show()
		s4_level_3_label.show()
		s4_level_3.get_node("Lock").hide()
	
	if (preference.s4_level_4 == false):
		s4_level_4.set_disabled(true)
		s4_level_4_sprite.hide()
		s4_level_4_label.hide()
		s4_level_4.get_node("Lock").show()
	elif (preference.s4_level_4 == true):
		if (preference.s4_level_4_stars == 0):
			s4_level_4_sprite.set_texture(stars_0)
		elif (preference.s4_level_4_stars == 0.5):
			s4_level_4_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_4_stars == 1):
			s4_level_4_sprite.set_texture(stars_2)
		elif (preference.s4_level_4_stars == 1.5):
			s4_level_4_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_4_stars == 2):
			s4_level_4_sprite.set_texture(stars_2)
		elif (preference.s4_level_4_stars == 2.5):
			s4_level_4_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_4_stars == 3):
			s4_level_4_sprite.set_texture(stars_3)
		
		s4_level_4.set_disabled(false)
		s4_level_4_sprite.show()
		s4_level_4_label.show()
		s4_level_4.get_node("Lock").hide()
	
	if (preference.s4_level_5 == false):
		s4_level_5.set_disabled(true)
		s4_level_5_sprite.hide()
		s4_level_5_label.hide()
		s4_level_5.get_node("Lock").show()
	elif (preference.s4_level_5 == true):
		if (preference.s4_level_4_stars == 0):
			s4_level_5_sprite.set_texture(stars_0)
		elif (preference.s4_level_5_stars == 0.5):
			s4_level_5_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_5_stars == 1):
			s4_level_5_sprite.set_texture(stars_2)
		elif (preference.s4_level_5_stars == 1.5):
			s4_level_5_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_5_stars == 2):
			s4_level_5_sprite.set_texture(stars_2)
		elif (preference.s4_level_5_stars == 2.5):
			s4_level_5_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_5_stars == 3):
			s4_level_5_sprite.set_texture(stars_3)
		
		s4_level_5.set_disabled(false)
		s4_level_5_sprite.show()
		s4_level_5_label.show()
		s4_level_5.get_node("Lock").hide()
	
	if (preference.s4_level_6 == false):
		s4_level_6.set_disabled(true)
		s4_level_6_sprite.hide()
		s4_level_6_label.hide()
		s4_level_6.get_node("Lock").show()
	elif (preference.s4_level_6 == true):
		if (preference.s4_level_6_stars == 0):
			s4_level_6_sprite.set_texture(stars_0)
		elif (preference.s4_level_6_stars == 0.5):
			s4_level_6_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_6_stars == 1):
			s4_level_6_sprite.set_texture(stars_2)
		elif (preference.s4_level_6_stars == 1.5):
			s4_level_6_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_6_stars == 2):
			s4_level_6_sprite.set_texture(stars_2)
		elif (preference.s4_level_6_stars == 2.5):
			s4_level_6_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_6_stars == 3):
			s4_level_6_sprite.set_texture(stars_3)
		
		s4_level_6.set_disabled(false)
		s4_level_6_sprite.show()
		s4_level_6_label.show()
		s4_level_6.get_node("Lock").hide()
	
	if (preference.s4_level_7 == false):
		s4_level_7.set_disabled(true)
		s4_level_7_sprite.hide()
		s4_level_7_label.hide()
		s4_level_7.get_node("Lock").show()
	elif (preference.s4_level_7 == true):
		if (preference.s4_level_7_stars == 0):
			s4_level_7_sprite.set_texture(stars_0)
		elif (preference.s4_level_7_stars == 0.5):
			s4_level_7_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_7_stars == 1):
			s4_level_7_sprite.set_texture(stars_2)
		elif (preference.s4_level_7_stars == 1.5):
			s4_level_7_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_7_stars == 2):
			s4_level_7_sprite.set_texture(stars_2)
		elif (preference.s4_level_7_stars == 2.5):
			s4_level_7_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_7_stars == 3):
			s4_level_7_sprite.set_texture(stars_3)
		
		s4_level_7.set_disabled(false)
		s4_level_7_sprite.show()
		s4_level_7_label.show()
		s4_level_7.get_node("Lock").hide()
	
	if (preference.s4_level_8 == false):
		s4_level_8.set_disabled(true)
		s4_level_8_sprite.hide()
		s4_level_8_label.hide()
		s4_level_8.get_node("Lock").show()
	elif (preference.s4_level_8 == true):
		if (preference.s4_level_8_stars == 0):
			s4_level_8_sprite.set_texture(stars_0)
		elif (preference.s4_level_8_stars == 0.5):
			s4_level_8_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_8_stars == 1):
			s4_level_8_sprite.set_texture(stars_2)
		elif (preference.s4_level_8_stars == 1.5):
			s4_level_8_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_8_stars == 2):
			s4_level_8_sprite.set_texture(stars_2)
		elif (preference.s4_level_8_stars == 2.5):
			s4_level_8_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_8_stars == 3):
			s4_level_8_sprite.set_texture(stars_3)
		
		s4_level_8.set_disabled(false)
		s4_level_8_sprite.show()
		s4_level_8_label.show()
		s4_level_8.get_node("Lock").hide()
	
	if (preference.s4_level_9 == false):
		s4_level_9.set_disabled(true)
		s4_level_9_sprite.hide()
		s4_level_9_label.hide()
		s4_level_9.get_node("Lock").show()
	elif (preference.s4_level_9 == true):
		if (preference.s4_level_9_stars == 0):
			s4_level_9_sprite.set_texture(stars_0)
		elif (preference.s4_level_9_stars == 0.5):
			s4_level_9_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_9_stars == 1):
			s4_level_9_sprite.set_texture(stars_2)
		elif (preference.s4_level_9_stars == 1.5):
			s4_level_9_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_9_stars == 2):
			s4_level_9_sprite.set_texture(stars_2)
		elif (preference.s4_level_9_stars == 2.5):
			s4_level_9_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_9_stars == 3):
			s4_level_9_sprite.set_texture(stars_3)
		
		s4_level_9.set_disabled(false)
		s4_level_9_sprite.show()
		s4_level_9_label.show()
		s4_level_9.get_node("Lock").hide()
	
	if (preference.s4_level_10 == false):
		s4_level_10.set_disabled(true)
		s4_level_10_sprite.hide()
		s4_level_10_label.hide()
		s4_level_10.get_node("Lock").show()
	elif (preference.s4_level_10 == true):
		if (preference.s4_level_10_stars == 0):
			s4_level_10_sprite.set_texture(stars_0)
		elif (preference.s4_level_10_stars == 0.5):
			s4_level_10_sprite.set_texture(stars_0_5)
		elif (preference.s4_level_10_stars == 1):
			s4_level_10_sprite.set_texture(stars_2)
		elif (preference.s4_level_10_stars == 1.5):
			s4_level_10_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_10_stars == 2):
			s4_level_10_sprite.set_texture(stars_2)
		elif (preference.s4_level_10_stars == 2.5):
			s4_level_10_sprite.set_texture(stars_2_5)
		elif (preference.s4_level_10_stars == 3):
			s4_level_10_sprite.set_texture(stars_3)
		
		s4_level_10.set_disabled(false)
		s4_level_10_sprite.show()
		s4_level_10_label.show()
		s4_level_10.get_node("Lock").hide()
	
	##########################################################################
	
	# This is for the levels in stage 5
	if (preference.s5_level_1 == false):
		s5_level_1.set_disabled(true)
		s5_level_1_sprite.hide()
		s5_level_1_label.hide()
		s5_level_1.get_node("Lock").show()
	elif (preference.s5_level_1 == true):
		if (preference.s5_level_1_stars == 0):
			s5_level_1_sprite.set_texture(stars_0)
		elif (preference.s5_level_1_stars == 0.5):
			s5_level_1_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_1_stars == 1):
			s5_level_1_sprite.set_texture(stars_2)
		elif (preference.s5_level_1_stars == 1.5):
			s5_level_1_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_1_stars == 2):
			s5_level_1_sprite.set_texture(stars_2)
		elif (preference.s5_level_1_stars == 2.5):
			s5_level_1_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_1_stars == 3):
			s5_level_1_sprite.set_texture(stars_3)
		
		s5_level_1.set_disabled(false)
		s5_level_1_sprite.show()
		s5_level_1_label.show()
		s5_level_1.get_node("Lock").hide()
	
	if (preference.s5_level_2 == false):
		s5_level_2.set_disabled(true)
		s5_level_2_sprite.hide()
		s5_level_2_label.hide()
		s5_level_2.get_node("Lock").show()
	elif (preference.s5_level_2 == true):
		if (preference.s5_level_2_stars == 0):
			s5_level_2_sprite.set_texture(stars_0)
		elif (preference.s5_level_2_stars == 0.5):
			s5_level_2_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_2_stars == 1):
			s5_level_2_sprite.set_texture(stars_2)
		elif (preference.s5_level_2_stars == 1.5):
			s5_level_2_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_2_stars == 2):
			s5_level_2_sprite.set_texture(stars_2)
		elif (preference.s5_level_2_stars == 2.5):
			s5_level_2_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_2_stars == 3):
			s5_level_2_sprite.set_texture(stars_3)
		
		s5_level_2.set_disabled(false)
		s5_level_2_sprite.show()
		s5_level_2_label.show()
		s5_level_2.get_node("Lock").hide()
	
	if (preference.s5_level_3 == false):
		s5_level_3.set_disabled(true)
		s5_level_3_sprite.hide()
		s5_level_3_label.hide()
		s5_level_3.get_node("Lock").show()
	elif (preference.s5_level_3 == true):
		if (preference.s5_level_3_stars == 0):
			s5_level_3_sprite.set_texture(stars_0)
		elif (preference.s5_level_3_stars == 0.5):
			s5_level_3_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_3_stars == 1):
			s5_level_3_sprite.set_texture(stars_2)
		elif (preference.s5_level_3_stars == 1.5):
			s5_level_3_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_3_stars == 2):
			s5_level_3_sprite.set_texture(stars_2)
		elif (preference.s5_level_3_stars == 2.5):
			s5_level_3_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_3_stars == 3):
			s5_level_3_sprite.set_texture(stars_3)
		
		s5_level_3.set_disabled(false)
		s5_level_3_sprite.show()
		s5_level_3_label.show()
		s5_level_3.get_node("Lock").hide()
	
	if (preference.s5_level_4 == false):
		s5_level_4.set_disabled(true)
		s5_level_4_sprite.hide()
		s5_level_4_label.hide()
		s5_level_4.get_node("Lock").show()
	elif (preference.s5_level_4 == true):
		if (preference.s5_level_4_stars == 0):
			s5_level_4_sprite.set_texture(stars_0)
		elif (preference.s5_level_4_stars == 0.5):
			s5_level_4_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_4_stars == 1):
			s5_level_4_sprite.set_texture(stars_2)
		elif (preference.s5_level_4_stars == 1.5):
			s5_level_4_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_4_stars == 2):
			s5_level_4_sprite.set_texture(stars_2)
		elif (preference.s5_level_4_stars == 2.5):
			s5_level_4_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_4_stars == 3):
			s5_level_4_sprite.set_texture(stars_3)
		
		s5_level_4.set_disabled(false)
		s5_level_4_sprite.show()
		s5_level_4_label.show()
		s5_level_4.get_node("Lock").hide()
	
	if (preference.s5_level_5 == false):
		s5_level_5.set_disabled(true)
		s5_level_5_sprite.hide()
		s5_level_5_label.hide()
		s5_level_5.get_node("Lock").show()
	elif (preference.s5_level_5 == true):
		if (preference.s5_level_5_stars == 0):
			s5_level_5_sprite.set_texture(stars_0)
		elif (preference.s5_level_5_stars == 0.5):
			s5_level_5_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_5_stars == 1):
			s5_level_5_sprite.set_texture(stars_2)
		elif (preference.s5_level_5_stars == 1.5):
			s5_level_5_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_5_stars == 2):
			s5_level_5_sprite.set_texture(stars_2)
		elif (preference.s5_level_5_stars == 2.5):
			s5_level_5_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_5_stars == 3):
			s5_level_5_sprite.set_texture(stars_3)
		
		s5_level_5.set_disabled(false)
		s5_level_5_sprite.show()
		s5_level_5_label.show()
		s5_level_5.get_node("Lock").hide()
	
	if (preference.s5_level_6 == false):
		s5_level_6.set_disabled(true)
		s5_level_6_sprite.hide()
		s5_level_6_label.hide()
		s5_level_6.get_node("Lock").show()
	elif (preference.s5_level_6 == true):
		if (preference.s5_level_6_stars == 0):
			s5_level_6_sprite.set_texture(stars_0)
		elif (preference.s5_level_6_stars == 0.5):
			s5_level_6_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_6_stars == 1):
			s5_level_6_sprite.set_texture(stars_2)
		elif (preference.s5_level_6_stars == 1.5):
			s5_level_6_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_6_stars == 2):
			s5_level_6_sprite.set_texture(stars_2)
		elif (preference.s5_level_6_stars == 2.5):
			s5_level_6_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_6_stars == 3):
			s5_level_6_sprite.set_texture(stars_3)
		
		s5_level_6.set_disabled(false)
		s5_level_6_sprite.show()
		s5_level_6_label.show()
		s5_level_6.get_node("Lock").hide()
	
	if (preference.s5_level_7 == false):
		s5_level_7.set_disabled(true)
		s5_level_7_sprite.hide()
		s5_level_7_label.hide()
		s5_level_7.get_node("Lock").show()
	elif (preference.s5_level_7 == true):
		if (preference.s5_level_7_stars == 0):
			s5_level_7_sprite.set_texture(stars_0)
		elif (preference.s5_level_7_stars == 0.5):
			s5_level_7_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_7_stars == 1):
			s5_level_7_sprite.set_texture(stars_2)
		elif (preference.s5_level_7_stars == 1.5):
			s5_level_7_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_7_stars == 2):
			s5_level_7_sprite.set_texture(stars_2)
		elif (preference.s5_level_7_stars == 2.5):
			s5_level_7_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_7_stars == 3):
			s5_level_7_sprite.set_texture(stars_3)
		
		s5_level_7.set_disabled(false)
		s5_level_7_sprite.show()
		s5_level_7_label.show()
		s5_level_7.get_node("Lock").hide()
	
	if (preference.s5_level_8 == false):
		s5_level_8.set_disabled(true)
		s5_level_8_sprite.hide()
		s5_level_8_label.hide()
		s5_level_8.get_node("Lock").show()
	elif (preference.s5_level_8 == true):
		if (preference.s5_level_8_stars == 0):
			s5_level_8_sprite.set_texture(stars_0)
		elif (preference.s5_level_8_stars == 0.5):
			s5_level_8_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_8_stars == 1):
			s5_level_8_sprite.set_texture(stars_2)
		elif (preference.s5_level_8_stars == 1.5):
			s5_level_8_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_8_stars == 2):
			s5_level_8_sprite.set_texture(stars_2)
		elif (preference.s5_level_8_stars == 2.5):
			s5_level_8_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_8_stars == 3):
			s5_level_8_sprite.set_texture(stars_3)
		
		s5_level_8.set_disabled(false)
		s5_level_8_sprite.show()
		s5_level_8_label.show()
		s5_level_8.get_node("Lock").hide()
	
	if (preference.s5_level_9 == false):
		s5_level_9.set_disabled(true)
		s5_level_9_sprite.hide()
		s5_level_9_label.hide()
		s5_level_9.get_node("Lock").show()
	elif (preference.s5_level_9 == true):
		if (preference.s5_level_9_stars == 0):
			s5_level_9_sprite.set_texture(stars_0)
		elif (preference.s5_level_9_stars == 0.5):
			s5_level_9_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_9_stars == 1):
			s5_level_9_sprite.set_texture(stars_2)
		elif (preference.s5_level_9_stars == 1.5):
			s5_level_9_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_9_stars == 2):
			s5_level_9_sprite.set_texture(stars_2)
		elif (preference.s5_level_9_stars == 2.5):
			s5_level_9_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_9_stars == 3):
			s5_level_9_sprite.set_texture(stars_3)
		
		s5_level_9.set_disabled(false)
		s5_level_9_sprite.show()
		s5_level_9_label.show()
		s5_level_9.get_node("Lock").hide()
	
	if (preference.s5_level_10 == false):
		s5_level_10.set_disabled(true)
		s5_level_10_sprite.hide()
		s5_level_10_label.hide()
		s5_level_10.get_node("Lock").show()
	elif (preference.s5_level_10 == true):
		if (preference.s5_level_10_stars == 0):
			s5_level_10_sprite.set_texture(stars_0)
		elif (preference.s5_level_10_stars == 0.5):
			s5_level_10_sprite.set_texture(stars_0_5)
		elif (preference.s5_level_10_stars == 1):
			s5_level_10_sprite.set_texture(stars_2)
		elif (preference.s5_level_10_stars == 1.5):
			s5_level_10_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_10_stars == 2):
			s5_level_10_sprite.set_texture(stars_2)
		elif (preference.s5_level_10_stars == 2.5):
			s5_level_10_sprite.set_texture(stars_2_5)
		elif (preference.s5_level_10_stars == 3):
			s5_level_10_sprite.set_texture(stars_3)
		
		s5_level_10.set_disabled(false)
		s5_level_10_sprite.show()
		s5_level_10_label.show()
		s5_level_10.get_node("Lock").hide()
	
	##########################################################################
	
	# This is for the levels in stage extra
	if (preference.se_level_1 == false):
		se_level_1.set_disabled(true)
		se_level_1_sprite.hide()
		se_level_1_label.hide()
		se_level_1.get_node("Lock").show()
	elif (preference.se_level_1 == true):
		if (preference.se_level_1_stars == 0):
			se_level_1_sprite.set_texture(stars_0)
		elif (preference.se_level_1_stars == 0.5):
			se_level_1_sprite.set_texture(stars_0_5)
		elif (preference.se_level_1_stars == 1):
			se_level_1_sprite.set_texture(stars_2)
		elif (preference.se_level_1_stars == 1.5):
			se_level_1_sprite.set_texture(stars_2_5)
		elif (preference.se_level_1_stars == 2):
			se_level_1_sprite.set_texture(stars_2)
		elif (preference.se_level_1_stars == 2.5):
			se_level_1_sprite.set_texture(stars_2_5)
		elif (preference.se_level_1_stars == 3):
			se_level_1_sprite.set_texture(stars_3)
		
		se_level_1.set_disabled(false)
		se_level_1_sprite.show()
		se_level_1_label.show()
		se_level_1.get_node("Lock").hide()
	
	if (preference.se_level_2 == false):
		se_level_2.set_disabled(true)
		se_level_2_sprite.hide()
		se_level_2_label.hide()
		se_level_2.get_node("Lock").show()
	elif (preference.se_level_2 == true):
		if (preference.se_level_2_stars == 0):
			se_level_2_sprite.set_texture(stars_0)
		elif (preference.se_level_2_stars == 0.5):
			se_level_2_sprite.set_texture(stars_0_5)
		elif (preference.se_level_2_stars == 1):
			se_level_2_sprite.set_texture(stars_2)
		elif (preference.se_level_2_stars == 1.5):
			se_level_2_sprite.set_texture(stars_2_5)
		elif (preference.se_level_2_stars == 2):
			se_level_2_sprite.set_texture(stars_2)
		elif (preference.se_level_2_stars == 2.5):
			se_level_2_sprite.set_texture(stars_2_5)
		elif (preference.se_level_2_stars == 3):
			se_level_2_sprite.set_texture(stars_3)
		
		se_level_2.set_disabled(false)
		se_level_2_sprite.show()
		se_level_2_label.show()
		se_level_2.get_node("Lock").hide()
	
	if (preference.se_level_3 == false):
		se_level_3.set_disabled(true)
		se_level_3_sprite.hide()
		se_level_3_label.hide()
		se_level_3.get_node("Lock").show()
	elif (preference.se_level_3 == true):
		if (preference.se_level_3_stars == 0):
			se_level_3_sprite.set_texture(stars_0)
		elif (preference.se_level_3_stars == 0.5):
			se_level_3_sprite.set_texture(stars_0_5)
		elif (preference.se_level_3_stars == 1):
			se_level_3_sprite.set_texture(stars_2)
		elif (preference.se_level_3_stars == 1.5):
			se_level_3_sprite.set_texture(stars_2_5)
		elif (preference.se_level_3_stars == 2):
			se_level_3_sprite.set_texture(stars_2)
		elif (preference.se_level_3_stars == 2.5):
			se_level_3_sprite.set_texture(stars_2_5)
		elif (preference.se_level_3_stars == 3):
			se_level_3_sprite.set_texture(stars_3)
		
		se_level_3.set_disabled(false)
		se_level_3_sprite.show()
		se_level_3_label.show()
		se_level_3.get_node("Lock").hide()
	
	if (preference.se_level_4 == false):
		se_level_4.set_disabled(true)
		se_level_4_sprite.hide()
		se_level_4_label.hide()
		se_level_4.get_node("Lock").show()
	elif (preference.se_level_4 == true):
		if (preference.se_level_4_stars == 0):
			se_level_4_sprite.set_texture(stars_0)
		elif (preference.se_level_4_stars == 0.5):
			se_level_4_sprite.set_texture(stars_0_5)
		elif (preference.se_level_4_stars == 1):
			se_level_4_sprite.set_texture(stars_2)
		elif (preference.se_level_4_stars == 1.5):
			se_level_4_sprite.set_texture(stars_2_5)
		elif (preference.se_level_4_stars == 2):
			se_level_4_sprite.set_texture(stars_2)
		elif (preference.se_level_4_stars == 2.5):
			se_level_4_sprite.set_texture(stars_2_5)
		elif (preference.se_level_4_stars == 3):
			se_level_4_sprite.set_texture(stars_3)
		
		se_level_4.set_disabled(false)
		se_level_4_sprite.show()
		se_level_4_label.show()
		se_level_4.get_node("Lock").hide()
	
	if (preference.se_level_5 == false):
		se_level_5.set_disabled(true)
		se_level_5_sprite.hide()
		se_level_5_label.hide()
		se_level_5.get_node("Lock").show()
	elif (preference.se_level_5 == true):
		if (preference.se_level_5_stars == 0):
			se_level_5_sprite.set_texture(stars_0)
		elif (preference.se_level_5_stars == 0.5):
			se_level_5_sprite.set_texture(stars_0_5)
		elif (preference.se_level_5_stars == 1):
			se_level_5_sprite.set_texture(stars_2)
		elif (preference.se_level_5_stars == 1.5):
			se_level_5_sprite.set_texture(stars_2_5)
		elif (preference.se_level_5_stars == 2):
			se_level_5_sprite.set_texture(stars_2)
		elif (preference.se_level_5_stars == 2.5):
			se_level_5_sprite.set_texture(stars_2_5)
		elif (preference.se_level_5_stars == 3):
			se_level_5_sprite.set_texture(stars_3)
		
		se_level_5.set_disabled(false)
		se_level_5_sprite.show()
		se_level_5_label.show()
		se_level_5.get_node("Lock").hide()
	
	if (preference.se_level_6 == false):
		se_level_6.set_disabled(true)
		se_level_6_sprite.hide()
		se_level_6_label.hide()
		se_level_6.get_node("Lock").show()
	elif (preference.se_level_6 == true):
		if (preference.se_level_6_stars == 0):
			se_level_6_sprite.set_texture(stars_0)
		elif (preference.se_level_6_stars == 0.5):
			se_level_6_sprite.set_texture(stars_0_5)
		elif (preference.se_level_6_stars == 1):
			se_level_6_sprite.set_texture(stars_2)
		elif (preference.se_level_6_stars == 1.5):
			se_level_6_sprite.set_texture(stars_2_5)
		elif (preference.se_level_6_stars == 2):
			se_level_6_sprite.set_texture(stars_2)
		elif (preference.se_level_6_stars == 2.5):
			se_level_6_sprite.set_texture(stars_2_5)
		elif (preference.se_level_6_stars == 3):
			se_level_6_sprite.set_texture(stars_3)
		
		se_level_6.set_disabled(false)
		se_level_6_sprite.show()
		se_level_6_label.show()
		se_level_6.get_node("Lock").hide()
	
	if (preference.se_level_7 == false):
		se_level_7.set_disabled(true)
		se_level_7_sprite.hide()
		se_level_7_label.hide()
		se_level_7.get_node("Lock").show()
	elif (preference.se_level_7 == true):
		if (preference.se_level_7_stars == 0):
			se_level_7_sprite.set_texture(stars_0)
		elif (preference.se_level_7_stars == 0.5):
			se_level_7_sprite.set_texture(stars_0_5)
		elif (preference.se_level_7_stars == 1):
			se_level_7_sprite.set_texture(stars_2)
		elif (preference.se_level_7_stars == 1.5):
			se_level_7_sprite.set_texture(stars_2_5)
		elif (preference.se_level_7_stars == 2):
			se_level_7_sprite.set_texture(stars_2)
		elif (preference.se_level_7_stars == 2.5):
			se_level_7_sprite.set_texture(stars_2_5)
		elif (preference.se_level_7_stars == 3):
			se_level_7_sprite.set_texture(stars_3)
		
		se_level_7.set_disabled(false)
		se_level_7_sprite.show()
		se_level_7_label.show()
		se_level_7.get_node("Lock").hide()
	
	if (preference.se_level_8 == false):
		se_level_8.set_disabled(true)
		se_level_8_sprite.hide()
		se_level_8_label.hide()
		se_level_8.get_node("Lock").show()
	elif (preference.se_level_8 == true):
		if (preference.se_level_8_stars == 0):
			se_level_8_sprite.set_texture(stars_0)
		elif (preference.se_level_8_stars == 0.5):
			se_level_8_sprite.set_texture(stars_0_5)
		elif (preference.se_level_8_stars == 1):
			se_level_8_sprite.set_texture(stars_2)
		elif (preference.se_level_8_stars == 1.5):
			se_level_8_sprite.set_texture(stars_2_5)
		elif (preference.se_level_8_stars == 2):
			se_level_8_sprite.set_texture(stars_2)
		elif (preference.se_level_8_stars == 2.5):
			se_level_8_sprite.set_texture(stars_2_5)
		elif (preference.se_level_8_stars == 3):
			se_level_8_sprite.set_texture(stars_3)
		
		se_level_8.set_disabled(false)
		se_level_8_sprite.show()
		se_level_8_label.show()
		se_level_8.get_node("Lock").hide()
	
	if (preference.se_level_9 == false):
		se_level_9.set_disabled(true)
		se_level_9_sprite.hide()
		se_level_9_label.hide()
		se_level_9.get_node("Lock").show()
	elif (preference.se_level_9 == true):
		if (preference.se_level_9_stars == 0):
			se_level_9_sprite.set_texture(stars_0)
		elif (preference.se_level_9_stars == 0.5):
			se_level_9_sprite.set_texture(stars_0_5)
		elif (preference.se_level_9_stars == 1):
			se_level_9_sprite.set_texture(stars_2)
		elif (preference.se_level_9_stars == 1.5):
			se_level_9_sprite.set_texture(stars_2_5)
		elif (preference.se_level_9_stars == 2):
			se_level_9_sprite.set_texture(stars_2)
		elif (preference.se_level_9_stars == 2.5):
			se_level_9_sprite.set_texture(stars_2_5)
		elif (preference.se_level_9_stars == 3):
			se_level_9_sprite.set_texture(stars_3)
		
		se_level_9.set_disabled(false)
		se_level_9_sprite.show()
		se_level_9_label.show()
		se_level_9.get_node("Lock").hide()
	
	if (preference.se_level_10 == false):
		se_level_10.set_disabled(true)
		se_level_10_sprite.hide()
		se_level_10_label.hide()
		se_level_10.get_node("Lock").show()
	elif (preference.se_level_10 == true):
		if (preference.se_level_10_stars == 0):
			se_level_10_sprite.set_texture(stars_0)
		elif (preference.se_level_10_stars == 0.5):
			se_level_10_sprite.set_texture(stars_0_5)
		elif (preference.se_level_10_stars == 1):
			se_level_10_sprite.set_texture(stars_2)
		elif (preference.se_level_10_stars == 1.5):
			se_level_10_sprite.set_texture(stars_2_5)
		elif (preference.se_level_10_stars == 2):
			se_level_10_sprite.set_texture(stars_2)
		elif (preference.se_level_10_stars == 2.5):
			se_level_10_sprite.set_texture(stars_2_5)
		elif (preference.se_level_10_stars == 3):
			se_level_10_sprite.set_texture(stars_3)
		
		se_level_10.set_disabled(false)
		se_level_10_sprite.show()
		se_level_10_label.show()
		se_level_10.get_node("Lock").hide()
	
	##########################################################################
	
	stage_1.connect("pressed", self, "stage_1")
	stage_2.connect("pressed", self, "stage_2")
	stage_3.connect("pressed", self, "stage_3")
	stage_4.connect("pressed", self, "stage_4")
	stage_5.connect("pressed", self, "stage_5")
	extra.connect("pressed", self, "extra")
	
	##########################################################################
	
	s1_level_1.connect("pressed", self, "s1_level_1")
	s1_level_2.connect("pressed", self, "s1_level_2")
	s1_level_3.connect("pressed", self, "s1_level_3")
	s1_level_4.connect("pressed", self, "s1_level_4")
	s1_level_5.connect("pressed", self, "s1_level_5")
	s1_level_6.connect("pressed", self, "s1_level_6")
	s1_level_7.connect("pressed", self, "s1_level_7")
	s1_level_8.connect("pressed", self, "s1_level_8")
	s1_level_9.connect("pressed", self, "s1_level_9")
	s1_level_10.connect("pressed", self, "s1_level_10")
	
	##########################################################################
	
	s2_level_1.connect("pressed", self, "s2_level_1")
	s2_level_2.connect("pressed", self, "s2_level_2")
	s2_level_3.connect("pressed", self, "s2_level_3")
	s2_level_4.connect("pressed", self, "s2_level_4")
	s2_level_5.connect("pressed", self, "s2_level_5")
	s2_level_6.connect("pressed", self, "s2_level_6")
	s2_level_7.connect("pressed", self, "s2_level_7")
	s2_level_8.connect("pressed", self, "s2_level_8")
	s2_level_9.connect("pressed", self, "s2_level_9")
	s2_level_10.connect("pressed", self, "s2_level_10")
	
	##########################################################################
	
	s3_level_1.connect("pressed", self, "s3_level_1")
	s3_level_2.connect("pressed", self, "s3_level_2")
	s3_level_3.connect("pressed", self, "s3_level_3")
	s3_level_4.connect("pressed", self, "s3_level_4")
	s3_level_5.connect("pressed", self, "s3_level_5")
	s3_level_6.connect("pressed", self, "s3_level_6")
	s3_level_7.connect("pressed", self, "s3_level_7")
	s3_level_8.connect("pressed", self, "s3_level_8")
	s3_level_9.connect("pressed", self, "s3_level_9")
	s3_level_10.connect("pressed", self, "s3_level_10")
	
	##########################################################################
	
	s4_level_1.connect("pressed", self, "s4_level_1")
	s4_level_2.connect("pressed", self, "s4_level_2")
	s4_level_3.connect("pressed", self, "s4_level_3")
	s4_level_4.connect("pressed", self, "s4_level_4")
	s4_level_5.connect("pressed", self, "s4_level_5")
	s4_level_6.connect("pressed", self, "s4_level_6")
	s4_level_7.connect("pressed", self, "s4_level_7")
	s4_level_8.connect("pressed", self, "s4_level_8")
	s4_level_9.connect("pressed", self, "s4_level_9")
	s4_level_10.connect("pressed", self, "s4_level_10")
	
	##########################################################################
	
	s5_level_1.connect("pressed", self, "s5_level_1")
	s5_level_2.connect("pressed", self, "s5_level_2")
	s5_level_3.connect("pressed", self, "s5_level_3")
	s5_level_4.connect("pressed", self, "s5_level_4")
	s5_level_5.connect("pressed", self, "s5_level_5")
	s5_level_6.connect("pressed", self, "s5_level_6")
	s5_level_7.connect("pressed", self, "s5_level_7")
	s5_level_8.connect("pressed", self, "s5_level_8")
	s5_level_9.connect("pressed", self, "s5_level_9")
	s5_level_10.connect("pressed", self, "s5_level_10")
	
	##########################################################################
	
	se_level_1.connect("pressed", self, "se_level_1")
	se_level_2.connect("pressed", self, "se_level_2")
	se_level_3.connect("pressed", self, "se_level_3")
	se_level_4.connect("pressed", self, "se_level_4")
	se_level_5.connect("pressed", self, "se_level_5")
	se_level_6.connect("pressed", self, "se_level_6")
	se_level_7.connect("pressed", self, "se_level_7")
	se_level_8.connect("pressed", self, "se_level_8")
	se_level_9.connect("pressed", self, "se_level_9")
	se_level_10.connect("pressed", self, "se_level_10")
	
	##########################################################################
	
	s1_back.connect("pressed", self, "back_to_stages")
	s2_back.connect("pressed", self, "back_to_stages")
	s3_back.connect("pressed", self, "back_to_stages")
	s4_back.connect("pressed", self, "back_to_stages")
	s5_back.connect("pressed", self, "back_to_stages")
	se_back.connect("pressed", self, "back_to_stages")
	pass


func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST || Input.is_action_just_pressed("ui_cancel")):
#		if (selector.scene == "Select"):
#			back_to_main()
		if (selector.scene == "Stages"):
			back_to_main()
#		elif (selector.state == "Multiplayer"):
#			back_to_play()
	
		if (selector.state == "Stage 1"):
			back_to_stages()
		elif (selector.state == "Stage 2"):
			back_to_stages()
		elif (selector.state == "Stage 3"):
			back_to_stages()
		elif (selector.state == "Stage 4"):
			back_to_stages()
		elif (selector.state == "Stage 5"):
			back_to_stages()
		elif (selector.state == "Extra"):
			back_to_stages()
	pass


func adventure():
	sfx_player.play()
	sub_title.set_text("STRING_STAGE_SEL")
	play_root.hide()
	stages_root.show()
	selector.scene = "Stages"
	selector.state = "Stages"
	selector.once = false
	pass


func multiplayer():
	sfx_player.play()
	sub_title.set_text("STRING_MULTIPLAY")
	play_root.hide()
	multiplayer_root.show()
	selector.scene = "Stages"
	selector.state = "Multiplayer"
	selector.once = false
	pass


func stage_1():
	sfx_player.play()
	sub_title.set_text("STAGE_1")
	stages_root.hide()
	stage_1_root.show()
	selector.scene = "Levels"
	selector.state = "Stage 1"
	selector.once = false
	pass


func stage_2():
	sfx_player.play()
	sub_title.set_text("STAGE_2")
	stages_root.hide()
	stage_2_root.show()
	selector.scene = "Levels"
	selector.state = "Stage 2"
	selector.once = false
	pass


func stage_3():
	sfx_player.play()
	sub_title.set_text("STAGE_3")
	stages_root.hide()
	stage_3_root.show()
	selector.scene = "Levels"
	selector.state = "Stage 3"
	selector.once = false
	pass


func stage_4():
	sfx_player.play()
	sub_title.set_text("STAGE_4")
	stages_root.hide()
	stage_4_root.show()
	selector.scene = "Levels"
	selector.state = "Stage 4"
	selector.once = false
	pass


func stage_5():
	sfx_player.play()
	sub_title.set_text("STAGE_5")
	stages_root.hide()
	stage_5_root.show()
	selector.scene = "Levels"
	selector.state = "Stage 5"
	selector.once = false
	pass


func extra():
	sfx_player.play()
	sub_title.set_text("STRING_EXTRA")
	stages_root.hide()
	extra_root.show()
	selector.scene = "Levels"
	selector.state = "Extra"
	selector.once = false
	pass


func s1_level_1():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelOne"
	functions.loader()
	pass


func s1_level_2():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelTwo"
	functions.loader()
	pass


func s1_level_3():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelThree"
	functions.loader()
	pass


func s1_level_4():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelFour"
	functions.loader()
	pass


func s1_level_5():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelFive"
	functions.loader()
	pass


func s1_level_6():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelSix"
	functions.loader()
	pass


func s1_level_7():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelSeven"
	functions.loader()
	pass


func s1_level_8():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelEight"
	functions.loader()
	pass


func s1_level_9():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelNine"
	functions.loader()
	pass


func s1_level_10():
	sfx_player.play()
	variables.loading_screen = "StageOneLevelTen"
	functions.loader()
	pass


func s2_level_1():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelOne"
	functions.loader()
	pass


func s2_level_2():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelTwo"
	functions.loader()
	pass


func s2_level_3():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelThree"
	functions.loader()
	pass


func s2_level_4():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelFour"
	functions.loader()
	pass


func s2_level_5():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelFive"
	functions.loader()
	pass


func s2_level_6():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelSix"
	functions.loader()
	pass


func s2_level_7():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelSeven"
	functions.loader()
	pass


func s2_level_8():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelEight"
	functions.loader()
	pass


func s2_level_9():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelNine"
	functions.loader()
	pass


func s2_level_10():
	sfx_player.play()
	variables.loading_screen = "StageTwoLevelTen"
	functions.loader()
	pass


func s3_level_1():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelOne"
	functions.loader()
	pass


func s3_level_2():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelTwo"
	functions.loader()
	pass


func s3_level_3():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelThree"
	functions.loader()
	pass


func s3_level_4():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelFour"
	functions.loader()
	pass


func s3_level_5():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelFive"
	functions.loader()
	pass


func s3_level_6():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelSix"
	functions.loader()
	pass


func s3_level_7():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelSeven"
	functions.loader()
	pass


func s3_level_8():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelEight"
	functions.loader()
	pass


func s3_level_9():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelNine"
	functions.loader()
	pass


func s3_level_10():
	sfx_player.play()
	variables.loading_screen = "StageThreeLevelTen"
	functions.loader()
	pass


func s4_level_1():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelOne"
	functions.loader()
	pass


func s4_level_2():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelTwo"
	functions.loader()
	pass


func s4_level_3():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelFour"
	functions.loader()
	pass


func s4_level_4():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelFour"
	functions.loader()
	pass


func s4_level_5():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelFive"
	functions.loader()
	pass


func s4_level_6():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelSix"
	functions.loader()
	pass


func s4_level_7():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelSeven"
	functions.loader()
	pass


func s4_level_8():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelEight"
	functions.loader()
	pass


func s4_level_9():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelNine"
	functions.loader()
	pass


func s4_level_10():
	sfx_player.play()
	variables.loading_screen = "StageFourLevelTen"
	functions.loader()
	pass


func s5_level_1():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelOne"
	functions.loader()
	pass


func s5_level_2():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelTwo"
	functions.loader()
	pass


func s5_level_3():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelFive"
	functions.loader()
	pass


func s5_level_4():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelFour"
	functions.loader()
	pass


func s5_level_5():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelFive"
	functions.loader()
	pass


func s5_level_6():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelSix"
	functions.loader()
	pass


func s5_level_7():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelSeven"
	functions.loader()
	pass


func s5_level_8():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelEight"
	functions.loader()
	pass


func s5_level_9():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelNine"
	functions.loader()
	pass


func s5_level_10():
	sfx_player.play()
	variables.loading_screen = "StageFiveLevelTen"
	functions.loader()
	pass


func se_level_1():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelOne"
	functions.loader()
	pass


func se_level_2():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelTwo"
	functions.loader()
	pass


func se_level_3():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelThree"
	functions.loader()
	pass


func se_level_4():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelFour"
	functions.loader()
	pass


func se_level_5():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelFive"
	functions.loader()
	pass


func se_level_6():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelSix"
	functions.loader()
	pass


func se_level_7():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelSeven"
	functions.loader()
	pass


func se_level_8():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelEight"
	functions.loader()
	pass


func se_level_9():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelNine"
	functions.loader()
	pass


func se_level_10():
	sfx_player.play()
	variables.loading_screen = "StageExtraLevelTen"
	functions.loader()
	pass


func back_to_main():
	sfx_player.play()
	variables.loading_screen = "Menu"
	functions.loader()
	pass


func back_to_play():
	sfx_player.play()
	stages_root.hide()
	multiplayer_root.hide()
	play_root.show()
	sub_title.show()
	sub_title.set_text("STRING_PLAY")
	selector.scene = "Select"
	selector.state = "Select"
	selector.once = false
	pass


func back_to_stages():
	sfx_player.play()
	stage_1_root.hide()
	stage_2_root.hide()
	stage_3_root.hide()
	stage_4_root.hide()
	stage_5_root.hide()
	extra_root.hide()
	stages_root.show()
	sub_title.show()
	selector.scene = "Stages"
	selector.state = "Stages"
	selector.once = false
	sub_title.set_text("STRING_STAGE_SEL")
	pass
