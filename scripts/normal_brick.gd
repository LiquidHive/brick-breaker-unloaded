tool
extends StaticBody2D


export var point = 10
export var harden = false
export var solid = false 

var editor_solid = solid setget show_solid

var drop_list = ["long_pad", "short_pad", "multi_balls", "laser", "life", "slow", "fast"]
var can_drop = false
var buff = ""

var next_rate = 36

var drop_selection
var drop_chance

var live_point = 3


func _ready():
	randomize()
	drop_chance = float(randi() % 100 + 1)
	
	if (solid == false):
		add_to_group("brick")
		
		if (harden):
			$ColorRect.color = Color(255, 0, 0, 255)
		else:
			if (drop_chance <= next_rate):
				$ColorRect.color = Color(0, 255, 174, 255)
				can_drop = true
	else:
		$Block.show()
	pass


func show_solid(new):
	if (Engine.editor_hint):
		if (new == true):
			$Block.show()
			$ColorRect.color = Color(255, 255, 0, 255)
			solid = true
		else:
			$Block.hide()
			solid = false
	pass


func queued():
	if (harden == false):
		drop_item()
		get_node("../../../").bricks -= 1
		queue_free()
	else:
		if (live_point == 3):
			$ColorRect.color = Color(0, 0, 225, 255)
			live_point = 2
		elif (live_point == 2):
			$ColorRect.color = Color(255, 0, 255, 255)
			live_point = 1
		elif (live_point == 1):
			if (drop_chance <= next_rate):
				$ColorRect.color = Color(0, 255, 174, 255)
				can_drop = true
			else:
				$ColorRect.color = Color(255, 255, 0, 255)
			live_point = 0
		elif (live_point == 0):
			drop_item()
			get_node("../../../").bricks -= 1
			queue_free()
	pass


func drop_item():
	if (can_drop):
		randomize()
		drop_selection = randi() % 6 + 1
		
		if (drop_selection == 1):
			long_pad()
		elif (drop_selection == 2):
			short_pad()
		elif (drop_selection == 3):
			laser()
#		elif (drop_selection == 3):
#			multi_balls()
		elif (drop_selection == 4):
			life()
		elif (drop_selection == 5):
			slow()
		elif (drop_selection == 6):
			fast()
		elif (drop_selection == 7):
			pass
	pass


func long_pad():
	var buffs_instance = $"../../../".buffs_preload.instance()
	buffs_instance.get_node("LongPad").show()
	buffs_instance.type = "long_pad"
	buffs_instance.global_position = $DropSpawn.global_position
	$"../../Drops".add_child(buffs_instance)
	pass


func short_pad():
	var buffs_instance = $"../../../".buffs_preload.instance()
	buffs_instance.get_node("ShortPad").show()
	buffs_instance.type = "short_pad"
	buffs_instance.global_position = $DropSpawn.global_position
	$"../../Drops".add_child(buffs_instance)
	pass


func multi_balls():
	var buffs_instance = $"../../../".buffs_preload.instance()
	buffs_instance.get_node("MultiBalls").show()
	buffs_instance.type = "multi_balls"
	buffs_instance.global_position = $DropSpawn.global_position
	$"../../Drops".add_child(buffs_instance)
	pass


func laser():
	var buffs_instance = $"../../../".buffs_preload.instance()
	buffs_instance.get_node("Laser").show()
	buffs_instance.type = "laser"
	buffs_instance.global_position = $DropSpawn.global_position
	$"../../Drops".add_child(buffs_instance)
	pass


func life():
	var buffs_instance = $"../../../".buffs_preload.instance()
	buffs_instance.get_node("Life").show()
	buffs_instance.type = "life"
	buffs_instance.global_position = $DropSpawn.global_position
	$"../../Drops".add_child(buffs_instance)
	pass


func slow():
	var buffs_instance = $"../../../".buffs_preload.instance()
	buffs_instance.get_node("Slow").show()
	buffs_instance.type = "slow"
	buffs_instance.global_position = $DropSpawn.global_position
	$"../../Drops".add_child(buffs_instance)
	pass


func fast():
	var buffs_instance = $"../../../".buffs_preload.instance()
	buffs_instance.get_node("Fast").show()
	buffs_instance.type = "fast"
	buffs_instance.global_position = $DropSpawn.global_position
	$"../../Drops".add_child(buffs_instance)
	pass
