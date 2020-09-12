extends Control


onready var sfx_player = utility.sound_fx


func _ready():
	$Next.connect("pressed", self, "next")
	
	$Slide.show()
	pass


func next():
	sfx_player.play()
	
	if ($Slide.is_visible()):
		if (variables.how_to_play == true):
			get_tree().change_scene("res://stages/stage_1/level_1.tscn")
			variables.how_to_play = false
		else:
			self.hide()
			get_parent().get_node("Help").show()
			get_parent().get_node("../SubTitle").show()
	pass
