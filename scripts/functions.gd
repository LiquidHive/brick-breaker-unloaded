extends Node


onready var root = get_tree().get_root()
onready var current_scene = root.get_child(root.get_child_count() - 1)

onready var timer = Timer.new()

var options = ["Continue", "Ads"] # 75% to return true.
var chosen_death = "Null"
var chosen_next = "Null"

var rand_once = false
var once = false

var death_rate = 36 # 42
var next_rate = 42 # 36

var clicks_num = 0
var max_clicks = 22

var death_rand_num
var next_rand_num

signal contact


func _ready():
	timer.set_wait_time(0.6)
	timer.set_one_shot(true)
	timer.connect("timeout", self, "timeout")
	current_scene.add_child(timer)
	pass


func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_FOCUS_OUT):
			# the game window just lost focus from the operating system
			if ("Stage" in root.get_child(root.get_child_count() - 1).name):
				if (get_tree().root.get_child(get_tree().root.get_child_count() - 1).game == true):
					get_tree().root.get_child(get_tree().root.get_child_count() - 1).get_node("Pause").pause()
	pass


func loader():
	get_tree().change_scene("res://scenes/hud/loading_screen.tscn")
	pass


func die():
	emit_signal("contact")
	
	if (get_tree().get_root().get_child(root.get_child_count() - 1).get_node("Game/Drops").get_children() != null):
		for i in get_tree().get_root().get_child(root.get_child_count() - 1).get_node("Game/Drops").get_children():
			i.queue_free()
	
#	death_rand_num = 0
	
#	if (rand_once == false):
		# This is the RNG for when you die to the next level.
#		death_rand_num = float(randi() % 100 + 1)
		# print("Death rand num is: " + str(death_rand_num))
		
#		if (death_rand_num <= death_rate):
#			chosen_death = options[1]
#		elif (death_rand_num > death_rate): # If the random is greater than the death_rate then ads.
#			chosen_death = options[0]
#		rand_once = true
	
#	if (clicks_num >= max_clicks):
#		clicks_num = 0
	
#	if (once == false):
#		if (chosen_death == options[0]): # No Ads!
#			emit_signal("contact")
#		elif (chosen_death == options[1] && clicks_num == 0): # Ads!
##			die_advertisement()
#			emit_signal("contact")
#		elif (chosen_death == options[1] && clicks_num > 0):
#			emit_signal("contact")
#			clicks_num += 1
#		once = true
	pass


func next_level():
	next_rand_num = 0
	
	if (rand_once == false):
	# This is the RNG for when you continue to the next level.
		next_rand_num = float(randi() % 100 + 1)
		# print("Next rand num is: " + str(next_rand_num))
		
		if (next_rand_num <= next_rate):
			chosen_next = options[1]
		elif (next_rand_num > next_rate):
			chosen_next = options[0]
		rand_once = true
	
	if (once == false):
		if (chosen_next == options[0]):
			loader()
		elif (chosen_next == options[1]):
#			next_advertisement()
			loader()
		once = true
	pass


func timeout():
	current_scene.get_node("Pause").ads_pause()
	pass


#func die_advertisement():
#	if (preference.remove_ads == false):
#		if admob.admob != null:
#			admob.admob.showInterstitial()
#	clicks_num += 1
#	pass


#func next_advertisement():
#	if (preference.remove_ads == false):
#		if admob.admob != null:
#			admob.admob.showInterstitial()
#	pass
