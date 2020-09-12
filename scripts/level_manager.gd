extends Node


export var can_move = false

onready var default_ball_preload = preload("res://scenes/items/balls/default_ball.tscn")
onready var buffs_preload = preload("res://scenes/items/drops/buffs.tscn")

onready var config = ConfigFile.new()

onready var timer = get_node("Timer") # Reset timer.

onready var score = $Pause/UI/Hub/Score
onready var lives = $Pause/UI/Hub/Lives
onready var highscore = $Pause/UI/Hub/HighScore

# Debug mode. ture | false
var default_spawn_point = true # Spawn the player at the starting platform.
var show_pause_hub = true # Show the touch UI for mobile.
var touch_buttons = true

var file_path = "user://ConfigFile.txt"

var bricks = 0
var has_lives

var score_val = 0
var highscore_val

var buffs = []

var last_spawn_ball

var was_in_last = ""

const SPEED_MODIFIER = 1.8

var speed_val

var ball_modifier

var game


func _ready():
	config.load(file_path)
	preference.get_config()
	
	for i in $Game/Bricks.get_children():
		if (i.is_in_group("brick")):
			bricks += 1
	
	can_move = true
	game = true
	
	if (preference.lives <= 0):
		preference.lives = 3
		preference.apply_settings()
		get_tree().reload_current_scene()
	
	has_lives = preference.lives
	
	if (name == "Stage1Level1"):
		if (has_lives != 3):
			has_lives = 3
			preference.lives = 3
			preference.apply_settings()
			get_tree().reload_current_scene()
	
	highscore_val = preference.highscore
	lives.text = str(has_lives)
	highscore.text = str(highscore_val)
	
	if (name != "Stage1Level1"):
		score_val = variables.prev_score
		score.text = str(score_val)
	
	# Controller selector control settings.
	timer.connect("timeout", self, "restart")
	functions.connect("contact", self, "contact")
	functions.rand_once = false
	functions.once = false
	functions.clicks_num = 0
	
	if (get_name() == "Stage1Level1"):
		if (preference.how_to_play == true):
			variables.how_to_play = true
			get_tree().change_scene("res://scenes/hud/main.tscn")
			config.set_value("help", "how_to_play", false)
			config.save(file_path)
	
	# Hides screen screen UI for mobile.
	if (show_pause_hub):
		get_node("Pause/UI/Hub").show()
	else:
		get_node("Pause/UI/Hub").hide()
	
	# Hides touch screen controller for mobile.
	if (touch_buttons):
		get_node("Pause/PauseButton").show()
	elif (!touch_buttons):
		get_node("Pause/PauseButton").hide()
	pass


func _process(delta):
	if (bricks <= 0):
		preference.get_config()
		
		if (score_val > preference.highscore):
			preference.highscore = score_val
		
		preference.lives = has_lives
		preference.apply_settings()
		
		variables.prev_score = score_val
		
		if (name == "Stage1Level1"):
			variables.loading_screen = "StageOneLevelTwo"
		elif (name == "Stage1Level2"):
			variables.loading_screen = "StageOneLevelThree"
		elif (name == "Stage1Level3"):
			variables.loading_screen = "StageOneLevelFour"
		elif (name == "Stage1Level4"):
			variables.loading_screen = "StageOneLevelFive"
		elif (name == "Stage1Level5"):
			variables.loading_screen = "StageOneLevelSix"
		elif (name == "Stage1Level6"):
			variables.loading_screen = "StageOneLevelSiven"
		elif (name == "Stage1Level7"):
			variables.loading_screen = "StageOneLevelEight"
		elif (name == "Stage1Level8"):
			variables.loading_screen = "StageOneLevelNine"
		elif (name == "Stage1Level9"):
			variables.loading_screen = "StageOneLevelTen"
		elif (name == "Stage1Level10"):
			variables.loading_screen = "StageTwoLevelOne"
		
		if (name == "Stage2Level1"):
			variables.loading_screen = "StageTwoLevelTwo"
		elif (name == "Stage2Level2"):
			variables.loading_screen = "StageTwoLevelThree"
		elif (name == "Stage2Level3"):
			variables.loading_screen = "StageTwoLevelFour"
		elif (name == "Stage2Level4"):
			variables.loading_screen = "StageTwoLevelFive"
		elif (name == "Stage2Level5"):
			variables.loading_screen = "StageTwoLevelSix"
		elif (name == "Stage2Level6"):
			variables.loading_screen = "StageTwoLevelSiven"
		elif (name == "Stage2Level7"):
			variables.loading_screen = "StageTwoLevelEight"
		elif (name == "Stage2Level8"):
			variables.loading_screen = "StageTwoLevelNine"
		elif (name == "Stage2Level9"):
			variables.loading_screen = "StageTwoLevelTen"
		elif (name == "Stage2Level10"):
			variables.loading_screen = "StageThreeLevelOne"
		
		if (name == "Stage3Level1"):
			variables.loading_screen = "StageThreeLevelTwo"
		elif (name == "Stage3Level2"):
			variables.loading_screen = "StageThreeLevelThree"
		elif (name == "Stage3Level3"):
			variables.loading_screen = "StageThreeLevelFour"
		elif (name == "Stage3Level4"):
			variables.loading_screen = "StageThreeLevelFive"
		elif (name == "Stage3Level5"):
			variables.loading_screen = "Menu"
			variables.completed_screen = true
		
		functions.loader()
	pass


func restart(): # Resets the levels to the default state when the player dies and is respawning.
	$Pause.once = false
	remove_buffs()
	
	if ($Game/Balls.get_child_count() >= 0):
		has_lives -= 1
		preference.lives = has_lives
		preference.apply_settings()
		
		if (score_val > preference.highscore):
			preference.highscore = score_val
			highscore_val = score_val
		
		preference.apply_settings()
		
		if (has_lives <= 0):
			game_over()
		else:
			$Game/Paddle.spawn_ball = false
			$Game/Paddle.spawn_ball()
			$Game/Paddle.global_position.x = 360
	
	# Hides screen screen UI for mobile.
	if (show_pause_hub):
		get_node("Pause/UI/Hub").show()
	else:
		get_node("Pause/UI/Hub").hide()
	
	# Hides touch screen controller for mobile.
	if (touch_buttons):
		get_node("Pause/PauseButton").show()
	elif (!touch_buttons):
		get_node("Pause/PauseButton").hide()
	
	lives.text = str(has_lives)
	highscore.text = str(highscore_val)
	pass


func contact(): # When the players dies, this is called which starts the timer then runs restart function.
	timer.start()
	pass


func add_buffs(buff):
	if ("short_pad" in buffs):
		var index = 0
		
		for i in buffs:
			if (i != "short_pad"):
				index += 1
		
		if (buff == "long_pad"):
			buffs.remove(index)
	elif ("long_pad" in buffs):
		var index = 0
		
		for i in buffs:
			if (i != "long_pad"):
				index += 1
		
		if (buff == "short_pad"):
			buffs.remove(index)
	
	if (!buff in buffs):
		buffs.append(buff)
		
		if (buffs.size() >= 3):
			was_in_last = buffs.front()
			buffs.pop_front()
		
		update_buffs()
		apply_buffs()
	pass


func remove_buffs():
	buffs.clear()
	clear_buffs()
	pass


func update_buffs():
	if (!"long_pad" in buffs && was_in_last == "long_pad"):
		$"Game/Paddle/LongPad".hide()
		$"Game/Paddle/Normal".show()
		$"Game/Paddle/CollisionPolygon2D".polygon = PoolVector2Array([Vector2(-64, -16), Vector2(64, -16), Vector2(64, 16), Vector2(-64, 16)])
		was_in_last.empty()
		
		if ($"Game/Paddle".laser == true):
			$Game/Paddle/NormalLaser.show()
			$Game/Paddle/ShortLaser.hide()
			$Game/Paddle/LongLaser.hide()
			$"Game/Paddle".paddle_state = "normal"
	
	if (!"short_pad" in buffs && was_in_last == "short_pad"):
		$"Game/Paddle/LongPad".hide()
		$"Game/Paddle/Normal".show()
		$"Game/Paddle/CollisionPolygon2D".polygon = PoolVector2Array([Vector2(-64, -16), Vector2(64, -16), Vector2(64, 16), Vector2(-64, 16)])
		was_in_last.empty()
		
		if ($"Game/Paddle".laser == true):
			$Game/Paddle/NormalLaser.show()
			$Game/Paddle/ShortLaser.hide()
			$Game/Paddle/LongLaser.hide()
			$"Game/Paddle".paddle_state = "normal"
	
	if (!"multi_balls" in buffs):
		for i in $Game/Balls.get_children():
			if (i.name != "Ball"):
				i.queue_free()
	
	if (!"laser" in buffs):
		for i in $Game/Lasers.get_children():
			i.queue_free()
		$Game/Paddle/NormalLaser.hide()
		$Game/Paddle/ShortLaser.hide()
		$Game/Paddle/LongLaser.hide()
		$Game/Paddle.laser = false
	pass


func clear_buffs():
	if (!"long_pad" in buffs):
		$"Game/Paddle/LongPad".hide()
		$"Game/Paddle/Normal".show()
		$"Game/Paddle/CollisionPolygon2D".polygon = PoolVector2Array([Vector2(-64, -16), Vector2(64, -16), Vector2(64, 16), Vector2(-64, 16)])
		$"Game/Paddle".paddle_state = "normal"
		was_in_last.empty()
	
	if (!"short_pad" in buffs):
		$"Game/Paddle/LongPad".hide()
		$"Game/Paddle/Normal".show()
		$"Game/Paddle/CollisionPolygon2D".polygon = PoolVector2Array([Vector2(-64, -16), Vector2(64, -16), Vector2(64, 16), Vector2(-64, 16)])
		$"Game/Paddle".paddle_state = "normal"
		was_in_last.empty()
	
	if (!"multi_balls" in buffs):
		for i in $Game/Balls.get_children():
			if (i.name != "Ball"):
				i.queue_free()
	
	if (!"laser" in buffs):
		for i in $Game/Lasers.get_children():
			i.queue_free()
		$Game/Paddle/NormalLaser.hide()
		$Game/Paddle/ShortLaser.hide()
		$Game/Paddle/LongLaser.hide()
		$Game/Paddle.laser = false
	
	ball_modifier = false
	pass


func apply_buffs():
	if (buffs.back() == "long_pad"):
		$"Game/Paddle/LongPad".show()
		$"Game/Paddle/Normal".show()
		$"Game/Paddle/CollisionPolygon2D".polygon = PoolVector2Array([Vector2(-98, -16), Vector2(98, -16), Vector2(98, 16), Vector2(-98, 16)])
		
		if ("laser" in buffs):
			$Game/Paddle/NormalLaser.hide()
			$Game/Paddle/ShortLaser.hide()
			$Game/Paddle/LongLaser.show()
			$"Game/Paddle".paddle_state = "long_pad"
			$Game/Paddle.laser = true
	
	if (buffs.back() == "short_pad"):
		$"Game/Paddle/LongPad".hide()
		$"Game/Paddle/Normal".hide()
		$"Game/Paddle/CollisionPolygon2D".polygon = PoolVector2Array([Vector2(-30, -16), Vector2(30, -16), Vector2(30, 16), Vector2(-30, 16)])
		
		if ("laser" in buffs):
			$Game/Paddle/NormalLaser.hide()
			$Game/Paddle/ShortLaser.show()
			$Game/Paddle/LongLaser.hide()
			$"Game/Paddle".paddle_state = "short_pad"
			$Game/Paddle.laser = true
	
	if (buffs.back() == "multi_balls"):
		var times = 0
		var direction_val = 2
		
		while times < 3:
			var balls_instance = default_ball_preload.instance()
			var original_ball_pos = $Game/Balls/Ball.global_position
			$"Game/Balls".add_child(balls_instance)
			balls_instance.global_position = original_ball_pos
			balls_instance.applied_force = Vector2(direction_val * 100, -direction_val * 100)
			direction_val += 2
			times += 1
	
	if (buffs.back() == "laser"):
		if ("short_pad" in buffs):
			$Game/Paddle/NormalLaser.hide()
			$Game/Paddle/ShortLaser.show()
			$Game/Paddle/LongLaser.hide()
			$"Game/Paddle".paddle_state = "short_pad"
			$Game/Paddle.laser = true
		elif ("long_pad" in buffs):
			$Game/Paddle/NormalLaser.hide()
			$Game/Paddle/ShortLaser.hide()
			$Game/Paddle/LongLaser.show()
			$"Game/Paddle".paddle_state = "long_pad"
			$Game/Paddle.laser = true
		else:
			$Game/Paddle/NormalLaser.show()
			$Game/Paddle/ShortLaser.hide()
			$Game/Paddle/LongLaser.hide()
			$"Game/Paddle".paddle_state = "normal"
			$Game/Paddle.laser = true
	
	if (buffs.back() == "life"):
		has_lives += 1
		lives.text = str(has_lives)
		preference.lives = has_lives
		preference.apply_settings()
	
	if (buffs.back() == "slow"):
		for i in $Game/Balls.get_children():
			i.linear_velocity /= Vector2(SPEED_MODIFIER, SPEED_MODIFIER)
			speed_val = i.linear_velocity
			ball_modifier = true
	
	if (buffs.back() == "fast"):
		for i in $Game/Balls.get_children():
			i.linear_velocity *= Vector2(SPEED_MODIFIER, SPEED_MODIFIER)
			speed_val = i.linear_velocity
			ball_modifier = true
	pass


func add_point():
	score.text = str(score_val)
	pass


func game_over():
	for i in $Game/Balls.get_children():
		i.queue_free()
	
	can_move = false
	$Pause/UI/GameOver.show()
	preference.highscore = int(highscore.text)
	preference.apply_settings()
	pass
