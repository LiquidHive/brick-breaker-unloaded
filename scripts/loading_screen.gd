extends Node


onready var timer = get_node("Timer")

var loader
var wait_frames
var time_max = 100 # msec
var current_scene


func _ready():
	set_process(true)
	
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
	
	timer.connect("timeout", self, "trigger")
	
	if (variables.loading_screen == "Menu"):
		goto_scene("res://scenes/hud/main.tscn")
	
	##########################################################################
	
	elif (variables.loading_screen == "StageOneLevelOne"):
		goto_scene("res://stages/stage_1/level_1.tscn")
	elif (variables.loading_screen == "StageOneLevelTwo"):
		goto_scene("res://stages/stage_1/level_2.tscn")
	elif (variables.loading_screen == "StageOneLevelThree"):
		goto_scene("res://stages/stage_1/level_3.tscn")
	elif (variables.loading_screen == "StageOneLevelFour"):
		goto_scene("res://stages/stage_1/level_4.tscn")
	elif (variables.loading_screen == "StageOneLevelFive"):
		goto_scene("res://stages/stage_1/level_5.tscn")
	elif (variables.loading_screen == "StageOneLevelSix"):
		goto_scene("res://stages/stage_1/level_6.tscn")
	elif (variables.loading_screen == "StageOneLevelSeven"):
		goto_scene("res://stages/stage_1/level_7.tscn")
	elif (variables.loading_screen == "StageOneLevelEight"):
		goto_scene("res://stages/stage_1/level_8.tscn")
	elif (variables.loading_screen == "StageOneLevelNine"):
		goto_scene("res://stages/stage_1/level_9.tscn")
	elif (variables.loading_screen == "StageOneLevelTen"):
		goto_scene("res://stages/stage_1/level_10.tscn")
	
	##########################################################################
	
	elif (variables.loading_screen == "StageTwoLevelOne"):
		goto_scene("res://stages/stage_2/level_1.tscn")
	elif (variables.loading_screen == "StageTwoLevelTwo"):
		goto_scene("res://stages/stage_2/level_2.tscn")
	elif (variables.loading_screen == "StageTwoLevelThree"):
		goto_scene("res://stages/stage_2/level_3.tscn")
	elif (variables.loading_screen == "StageTwoLevelFour"):
		goto_scene("res://stages/stage_2/level_4.tscn")
	elif (variables.loading_screen == "StageTwoLevelFive"):
		goto_scene("res://stages/stage_2/level_5.tscn")
	elif (variables.loading_screen == "StageTwoLevelSix"):
		goto_scene("res://stages/stage_2/level_6.tscn")
	elif (variables.loading_screen == "StageTwoLevelSeven"):
		goto_scene("res://stages/stage_2/level_7.tscn")
	elif (variables.loading_screen == "StageTwoLevelEight"):
		goto_scene("res://stages/stage_2/level_8.tscn")
	elif (variables.loading_screen == "StageTwoLevelNine"):
		goto_scene("res://stages/stage_2/level_9.tscn")
	elif (variables.loading_screen == "StageTwoLevelTen"):
		goto_scene("res://stages/stage_2/level_10.tscn")
	
	##########################################################################
	
	elif (variables.loading_screen == "StageThreeLevelOne"):
		goto_scene("res://stages/stage_3/level_1.tscn")
	elif (variables.loading_screen == "StageThreeLevelTwo"):
		goto_scene("res://stages/stage_3/level_2.tscn")
	elif (variables.loading_screen == "StageThreeLevelThree"):
		goto_scene("res://stages/stage_3/level_3.tscn")
	elif (variables.loading_screen == "StageThreeLevelFour"):
		goto_scene("res://stages/stage_3/level_4.tscn")
	elif (variables.loading_screen == "StageThreeLevelFive"):
		goto_scene("res://stages/stage_3/level_5.tscn")
	elif (variables.loading_screen == "StageThreeLevelSix"):
		goto_scene("res://stages/stage_3/level_6.tscn")
	elif (variables.loading_screen == "StageThreeLevelSeven"):
		goto_scene("res://stages/stage_3/level_7.tscn")
	elif (variables.loading_screen == "StageThreeLevelEight"):
		goto_scene("res://stages/stage_3/level_8.tscn")
	elif (variables.loading_screen == "StageThreeLevelNine"):
		goto_scene("res://stages/stage_3/level_9.tscn")
	elif (variables.loading_screen == "StageThreeLevelTen"):
		goto_scene("res://stages/stage_3/level_10.tscn")
	
	##########################################################################
	
	elif (variables.loading_screen == "StageFourLevelOne"):
		goto_scene("res://stages/stage_4/level_1.tscn")
	elif (variables.loading_screen == "StageFourLevelTwo"):
		goto_scene("res://stages/stage_4/level_2.tscn")
	elif (variables.loading_screen == "StageFourLevelThree"):
		goto_scene("res://stages/stage_4/level_3.tscn")
	elif (variables.loading_screen == "StageFourLevelFour"):
		goto_scene("res://stages/stage_4/level_4.tscn")
	elif (variables.loading_screen == "StageFourLevelFive"):
		goto_scene("res://stages/stage_4/level_5.tscn")
	elif (variables.loading_screen == "StageFourLevelSix"):
		goto_scene("res://stages/stage_4/level_6.tscn")
	elif (variables.loading_screen == "StageFourLevelSeven"):
		goto_scene("res://stages/stage_4/level_7.tscn")
	elif (variables.loading_screen == "StageFourLevelEight"):
		goto_scene("res://stages/stage_4/level_8.tscn")
	elif (variables.loading_screen == "StageFourLevelNine"):
		goto_scene("res://stages/stage_4/level_9.tscn")
	elif (variables.loading_screen == "StageFourLevelTen"):
		goto_scene("res://stages/stage_4/level_10.tscn")
	
	##########################################################################
	
	elif (variables.loading_screen == "StageFiveLevelOne"):
		goto_scene("res://stages/stage_5/level_1.tscn")
	elif (variables.loading_screen == "StageFiveLevelTwo"):
		goto_scene("res://stages/stage_5/level_2.tscn")
	elif (variables.loading_screen == "StageFiveLevelThree"):
		goto_scene("res://stages/stage_5/level_3.tscn")
	elif (variables.loading_screen == "StageFiveLevelFour"):
		goto_scene("res://stages/stage_5/level_4.tscn")
	elif (variables.loading_screen == "StageFiveLevelFive"):
		goto_scene("res://stages/stage_5/level_5.tscn")
	elif (variables.loading_screen == "StageFiveLevelSix"):
		goto_scene("res://stages/stage_5/level_6.tscn")
	elif (variables.loading_screen == "StageFiveLevelSeven"):
		goto_scene("res://stages/stage_5/level_7.tscn")
	elif (variables.loading_screen == "StageFiveLevelEight"):
		goto_scene("res://stages/stage_5/level_8.tscn")
	elif (variables.loading_screen == "StageFiveLevelNine"):
		goto_scene("res://stages/stage_5/level_9.tscn")
	elif (variables.loading_screen == "StageFiveLevelTen"):
		goto_scene("res://stages/stage_5/level_10.tscn")
	
##########################################################################
	
	elif (variables.loading_screen == "StageExtraLevelOne"):
		goto_scene("res://stages/extra/level_1.tscn")
	elif (variables.loading_screen == "StageExtraLevelTwo"):
		goto_scene("res://stages/extra/level_2.tscn")
	elif (variables.loading_screen == "StageExtraLevelThree"):
		goto_scene("res://stages/extra/level_3.tscn")
	elif (variables.loading_screen == "StageExtraLevelFour"):
		goto_scene("res://stages/extra/level_4.tscn")
	elif (variables.loading_screen == "StageExtraLevelFive"):
		goto_scene("res://stages/extra/level_5.tscn")
	elif (variables.loading_screen == "StageExtraLevelSix"):
		goto_scene("res://stages/extra/level_6.tscn")
	elif (variables.loading_screen == "StageExtraLevelSeven"):
		goto_scene("res://stages/extra/level_7.tscn")
	elif (variables.loading_screen == "StageExtraLevelEight"):
		goto_scene("res://stages/extra/level_8.tscn")
	elif (variables.loading_screen == "StageExtraLevelNine"):
		goto_scene("res://stages/extra/level_9.tscn")
	elif (variables.loading_screen == "StageExtraLevelTen"):
		goto_scene("res://stages/extra/level_10.tscn")
	pass


func goto_scene(path): # game requests to switch to this scene
	loader = ResourceLoader.load_interactive(path)
	
	# check for errors
	if loader == null:
#		show_error()
		return
	set_process(true)
	
	wait_frames = 1
	pass


func _process(delta):
	if loader == null:
		# no need to process anymore
		set_process(false)
		return
	
	# wait for frames to let the "loading" animation to show up
	if wait_frames > 0:
		wait_frames -= 1
		return
	
	var t = OS.get_ticks_msec()
	
	while OS.get_ticks_msec() < t + time_max: # use "time_max" to control how much time we block this thread
		# poll your loader
		var err = loader.poll()
		
		if err == ERR_FILE_EOF: # load finished
			var resource = loader.get_resource()
			loader = null
			
			if (variables.loading_screen == "Menu"):
				main_menu()
#			elif (variables.loading_screen == "Play"):
#				play_menu()
			
			##########################################################################
			
			elif (variables.loading_screen == "StageOneLevelOne"):
				stage_1_level_1()
			elif (variables.loading_screen == "StageOneLevelTwo"):
				stage_1_level_2()
			elif (variables.loading_screen == "StageOneLevelThree"):
				stage_1_level_3()
			elif (variables.loading_screen == "StageOneLevelFour"):
				stage_1_level_4()
			elif (variables.loading_screen == "StageOneLevelFive"):
				stage_1_level_5()
			elif (variables.loading_screen == "StageOneLevelSix"):
				stage_1_level_6()
			elif (variables.loading_screen == "StageOneLevelSeven"):
				stage_1_level_7()
			elif (variables.loading_screen == "StageOneLevelEight"):
				stage_1_level_8()
			elif (variables.loading_screen == "StageOneLevelNine"):
				stage_1_level_9()
			elif (variables.loading_screen == "StageOneLevelTen"):
				stage_1_level_10()
			
			##########################################################################
			
			elif (variables.loading_screen == "StageTwoLevelOne"):
				stage_2_level_1()
			elif (variables.loading_screen == "StageTwoLevelTwo"):
				stage_2_level_2()
			elif (variables.loading_screen == "StageTwoLevelThree"):
				stage_2_level_3()
			elif (variables.loading_screen == "StageTwoLevelFour"):
				stage_2_level_4()
			elif (variables.loading_screen == "StageTwoLevelFive"):
				stage_2_level_5()
			elif (variables.loading_screen == "StageTwoLevelSix"):
				stage_2_level_6()
			elif (variables.loading_screen == "StageTwoLevelSeven"):
				stage_2_level_7()
			elif (variables.loading_screen == "StageTwoLevelEight"):
				stage_2_level_8()
			elif (variables.loading_screen == "StageTwoLevelNine"):
				stage_2_level_9()
			elif (variables.loading_screen == "StageTwoLevelTen"):
				stage_2_level_10()
			
			##########################################################################
			
			elif (variables.loading_screen == "StageThreeLevelOne"):
				stage_3_level_1()
			elif (variables.loading_screen == "StageThreeLevelTwo"):
				stage_3_level_2()
			elif (variables.loading_screen == "StageThreeLevelThree"):
				stage_3_level_3()
			elif (variables.loading_screen == "StageThreeLevelFour"):
				stage_3_level_4()
			elif (variables.loading_screen == "StageThreeLevelFive"):
				stage_3_level_5()
			elif (variables.loading_screen == "StageThreeLevelSix"):
				stage_3_level_6()
			elif (variables.loading_screen == "StageThreeLevelSeven"):
				stage_3_level_7()
			elif (variables.loading_screen == "StageThreeLevelEight"):
				stage_3_level_8()
			elif (variables.loading_screen == "StageThreeLevelNine"):
				stage_3_level_9()
			elif (variables.loading_screen == "StageThreeLevelTen"):
				stage_3_level_10()
			
			##########################################################################
			
			elif (variables.loading_screen == "StageFourLevelOne"):
				stage_4_level_1()
			elif (variables.loading_screen == "StageFourLevelTwo"):
				stage_4_level_2()
			elif (variables.loading_screen == "StageFourLevelThree"):
				stage_4_level_3()
			elif (variables.loading_screen == "StageFourLevelFour"):
				stage_4_level_4()
			elif (variables.loading_screen == "StageFourLevelFive"):
				stage_4_level_5()
			elif (variables.loading_screen == "StageFourLevelSix"):
				stage_4_level_6()
			elif (variables.loading_screen == "StageFourLevelSeven"):
				stage_4_level_7()
			elif (variables.loading_screen == "StageFourLevelEight"):
				stage_4_level_8()
			elif (variables.loading_screen == "StageFourLevelNine"):
				stage_4_level_9()
			elif (variables.loading_screen == "StageFourLevelTen"):
				stage_4_level_10()
			
			##########################################################################
			
			elif (variables.loading_screen == "StageFiveLevelOne"):
				stage_5_level_1()
			elif (variables.loading_screen == "StageFiveLevelTwo"):
				stage_5_level_2()
			elif (variables.loading_screen == "StageFiveLevelThree"):
				stage_5_level_3()
			elif (variables.loading_screen == "StageFiveLevelFour"):
				stage_5_level_4()
			elif (variables.loading_screen == "StageFiveLevelFive"):
				stage_5_level_5()
			elif (variables.loading_screen == "StageFiveLevelSix"):
				stage_5_level_6()
			elif (variables.loading_screen == "StageFiveLevelSeven"):
				stage_5_level_7()
			elif (variables.loading_screen == "StageFiveLevelEight"):
				stage_5_level_8()
			elif (variables.loading_screen == "StageFiveLevelNine"):
				stage_5_level_9()
			elif (variables.loading_screen == "StageFiveLevelTen"):
				stage_5_level_10()
			
			##########################################################################
			
			elif (variables.loading_screen == "StageExtraLevelOne"):
				extra_level_1()
			elif (variables.loading_screen == "StageExtraLevelTwo"):
				extra_level_2()
			elif (variables.loading_screen == "StageExtraLevelThree"):
				extra_level_3()
			elif (variables.loading_screen == "StageExtraLevelFour"):
				extra_level_4()
			elif (variables.loading_screen == "StageExtraLevelFive"):
				extra_level_5()
			elif (variables.loading_screen == "StageExtraLevelSix"):
				extra_level_6()
			elif (variables.loading_screen == "StageExtraLevelSeven"):
				extra_level_7()
			elif (variables.loading_screen == "StageExtraLevelEight"):
				extra_level_8()
			elif (variables.loading_screen == "StageExtraLevelNine"):
				extra_level_9()
			elif (variables.loading_screen == "StageExtraLevelTen"):
				extra_level_10()
			break
		
		elif (err == OK):
			update_progress()
		
		else: # error during loading
#			show_error()
			loader = null
			break
	pass


func update_progress():
	var progress = float(loader.get_stage()) / loader.get_stage_count()
	# update your progress bar?
	var prog = get_node("UI/ProgressBar")
	prog.set_value(progress * 100)
	pass

##########################################################################

func main_menu():
	get_tree().change_scene("res://scenes/hud/main.tscn")
	pass


##########################################################################

func stage_1_level_1():
	get_tree().change_scene("res://stages/stage_1/level_1.tscn")
	pass


func stage_1_level_2():
	get_tree().change_scene("res://stages/stage_1/level_2.tscn")
	pass


func stage_1_level_3():
	get_tree().change_scene("res://stages/stage_1/level_3.tscn")
	pass


func stage_1_level_4():
	get_tree().change_scene("res://stages/stage_1/level_4.tscn")
	pass


func stage_1_level_5():
	get_tree().change_scene("res://stages/stage_1/level_5.tscn")
	pass


func stage_1_level_6():
	get_tree().change_scene("res://stages/stage_1/level_6.tscn")
	pass


func stage_1_level_7():
	get_tree().change_scene("res://stages/stage_1/level_7.tscn")
	pass


func stage_1_level_8():
	get_tree().change_scene("res://stages/stage_1/level_8.tscn")
	pass


func stage_1_level_9():
	get_tree().change_scene("res://stages/stage_1/level_9.tscn")
	pass


func stage_1_level_10():
	get_tree().change_scene("res://stages/stage_1/level_10.tscn")
	pass

##########################################################################

func stage_2_level_1():
	get_tree().change_scene("res://stages/stage_2/level_1.tscn")
	pass


func stage_2_level_2():
	get_tree().change_scene("res://stages/stage_2/level_2.tscn")
	pass


func stage_2_level_3():
	get_tree().change_scene("res://stages/stage_2/level_3.tscn")
	pass


func stage_2_level_4():
	get_tree().change_scene("res://stages/stage_2/level_4.tscn")
	pass


func stage_2_level_5():
	get_tree().change_scene("res://stages/stage_2/level_5.tscn")
	pass


func stage_2_level_6():
	get_tree().change_scene("res://stages/stage_2/level_6.tscn")
	pass


func stage_2_level_7():
	get_tree().change_scene("res://stages/stage_2/level_7.tscn")
	pass


func stage_2_level_8():
	get_tree().change_scene("res://stages/stage_2/level_8.tscn")
	pass


func stage_2_level_9():
	get_tree().change_scene("res://stages/stage_2/level_9.tscn")
	pass


func stage_2_level_10():
	get_tree().change_scene("res://stages/stage_2/level_10.tscn")
	pass

##########################################################################

func stage_3_level_1():
	get_tree().change_scene("res://stages/stage_3/level_1.tscn")
	pass


func stage_3_level_2():
	get_tree().change_scene("res://stages/stage_3/level_2.tscn")
	pass


func stage_3_level_3():
	get_tree().change_scene("res://stages/stage_3/level_3.tscn")
	pass


func stage_3_level_4():
	get_tree().change_scene("res://stages/stage_3/level_4.tscn")
	pass


func stage_3_level_5():
	get_tree().change_scene("res://stages/stage_3/level_5.tscn")
	pass


func stage_3_level_6():
	get_tree().change_scene("res://stages/stage_3/level_6.tscn")
	pass


func stage_3_level_7():
	get_tree().change_scene("res://stages/stage_3/level_7.tscn")
	pass


func stage_3_level_8():
	get_tree().change_scene("res://stages/stage_3/level_8.tscn")
	pass


func stage_3_level_9():
	get_tree().change_scene("res://stages/stage_3/level_9.tscn")
	pass


func stage_3_level_10():
	get_tree().change_scene("res://stages/stage_3/level_10.tscn")
	pass

##########################################################################

func stage_4_level_1():
	get_tree().change_scene("res://stages/stage_4/level_1.tscn")
	pass


func stage_4_level_2():
	get_tree().change_scene("res://stages/stage_4/level_2.tscn")
	pass


func stage_4_level_3():
	get_tree().change_scene("res://stages/stage_4/level_3.tscn")
	pass


func stage_4_level_4():
	get_tree().change_scene("res://stages/stage_4/level_4.tscn")
	pass


func stage_4_level_5():
	get_tree().change_scene("res://stages/stage_4/level_5.tscn")
	pass


func stage_4_level_6():
	get_tree().change_scene("res://stages/stage_4/level_6.tscn")
	pass


func stage_4_level_7():
	get_tree().change_scene("res://stages/stage_4/level_7.tscn")
	pass


func stage_4_level_8():
	get_tree().change_scene("res://stages/stage_4/level_8.tscn")
	pass


func stage_4_level_9():
	get_tree().change_scene("res://stages/stage_4/level_9.tscn")
	pass


func stage_4_level_10():
	get_tree().change_scene("res://stages/stage_4/level_10.tscn")
	pass

##########################################################################

func stage_5_level_1():
	get_tree().change_scene("res://stages/stage_5/level_1.tscn")
	pass


func stage_5_level_2():
	get_tree().change_scene("res://stages/stage_5/level_2.tscn")
	pass


func stage_5_level_3():
	get_tree().change_scene("res://stages/stage_5/level_3.tscn")
	pass


func stage_5_level_4():
	get_tree().change_scene("res://stages/stage_5/level_4.tscn")
	pass


func stage_5_level_5():
	get_tree().change_scene("res://stages/stage_5/level_5.tscn")
	pass


func stage_5_level_6():
	get_tree().change_scene("res://stages/stage_5/level_6.tscn")
	pass


func stage_5_level_7():
	get_tree().change_scene("res://stages/stage_5/level_7.tscn")
	pass


func stage_5_level_8():
	get_tree().change_scene("res://stages/stage_5/level_8.tscn")
	pass


func stage_5_level_9():
	get_tree().change_scene("res://stages/stage_5/level_9.tscn")
	pass


func stage_5_level_10():
	get_tree().change_scene("res://stages/stage_5/level_10.tscn")
	pass

##########################################################################

func extra_level_1():
	get_tree().change_scene("res://stages/extra/level_1.tscn")
	pass


func extra_level_2():
	get_tree().change_scene("res://stages/extra/level_2.tscn")
	pass


func extra_level_3():
	get_tree().change_scene("res://stages/extra/level_3.tscn")
	pass


func extra_level_4():
	get_tree().change_scene("res://stages/extra/level_4.tscn")
	pass


func extra_level_5():
	get_tree().change_scene("res://stages/extra/level_5.tscn")
	pass


func extra_level_6():
	get_tree().change_scene("res://stages/extra/level_6.tscn")
	pass


func extra_level_7():
	get_tree().change_scene("res://stages/extra/level_7.tscn")
	pass


func extra_level_8():
	get_tree().change_scene("res://stages/extra/level_8.tscn")
	pass


func extra_level_9():
	get_tree().change_scene("res://stages/extra/level_9.tscn")
	pass


func extra_level_10():
	get_tree().change_scene("res://stages/extra/level_10.tscn")
	pass
