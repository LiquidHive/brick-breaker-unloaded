extends Control


# Gets the data from the main screen in the projects.
onready var game_version_num = get_parent().get_node("../../").game_version_num
onready var credits_scroll_speed = get_parent().get_node("../../").credits_scroll_speed

onready var credits_root = self # References to the root node in this scene.

# Credits
onready var credits_label = credits_root.get_node("KinematicBody2D") # Moves the credits label on the screen whic is based in a kinematicbody2D.
onready var credits_back = credits_root.get_node("TextureButton")

# Sets some values in the scene to display the different persons that contribute to the project.
var project_manager = "TheObviousChico"
var game_designers = "TheObviousChico"
var artists = "TheObviousChico"
var programmers = "TheObviousChico"
var music = "TheObviousChico"
var sound_effects = "TheObviousChico"
var quality_assurance = "TheObviousChico"

var credits_menu = false # Bool to check if the credits scene is being displayed.


func _ready():
	credits_back.connect("pressed", self, "back")
	set_process(true)
	set_physics_process(true)
	
	
	if (preference.language == "EN"): # English credits section.
		get_node("KinematicBody2D/Label").set_text("""BRICK BREAKER UNLOADED
		
		Version 
		%s
		
		Project Managers
		%s
		
		Game Designers & Level Design
		%s
		
		Artists & Animators
		%s
		
		Programmers
		%s
		
		Music
		%s
		
		Sound Effects
		%s
		
		Quality Assurance
		%s
		
		Special Thanks
		Godot Community
		
		Thanks For Playing!""" % [game_version_num, project_manager, game_designers, artists, programmers, music, sound_effects, quality_assurance])
	
	##########################################################################
	
	elif (preference.language == "ES"): # Spanish credits section.
		get_node("KinematicBody2D/Label").set_text("""BRICK BREAKER UNLOADED
		Versión 
		%s
		
		Gerentes De Proyecto
		%s
		
		Los Diseñadores De Juegos & Diseño De Nivel
		%s
		
		Artistas & Animadores
		%s
		
		Los Programadores
		%s
		
		Música
		%s
		
		Efectos De Sonido
		%s
		
		Seguro De Calidad
		%s
		
		Gracias Especiales
		Comunidad Godot
		
		¡Gracias Por Jugar!""" % [game_version_num, project_manager, game_designers, artists, programmers, music, sound_effects, quality_assurance])
	
	##########################################################################
	
	elif (preference.language == "PT"): # Portuguesse credits section.
		get_node("KinematicBody2D/Label").set_text("""BRICK BREAKER UNLOADED
		Versão %s
		
		Gerentes De Projeto
		%s
		
		Designers De Jogos & Level Design
		%s
		
		Artistas & Animadores
		%s
		
		Programadores
		%s
		
		Música
		%s
		
		Efeitos Sonoros
		%s
		
		Garantia Da Qualidade
		%s
		
		Agradecimentos Especiais
		Comunidade Godot
		
		Obrigado Por Jogar!""" % [game_version_num, project_manager, game_designers, artists, programmers, music, sound_effects, quality_assurance])
	
	##########################################################################
	
	elif (preference.language == "FR"): # French credits section.
		get_node("KinematicBody2D/Label").set_text("""BRICK BREAKER UNLOADED
		Version %s
		
		Chefs De Projet
		%s
		
		Game Designers & Level Design
		%s
		
		Artistes & Animateurs
		%s
		
		Programmeurs
		%s
		
		La Musique
		%s
		
		Effets Sonores
		%s
		
		Assurance Qualité
		%s
		
		Remerciement Spécial
		Godot Communauté
		
		Merci D'avoir Joué!""" % [game_version_num, project_manager, game_designers, artists, programmers, music, sound_effects, quality_assurance])
	pass


func _process(delta):
	# This line below is only for PC.
	if (Input.is_action_just_pressed("ui_accept") && credits_menu == true): # Checks if the user has press the accept button and if so runs the back() function.
		back()
	
	if (self.is_visible()): # Checks if the root node is visible.
		credits_menu = true
	else:
		credits_menu = false
	pass


func _physics_process(delta):
	if (credits_menu): # Move the credits label that is nested in a kinematicbody2D.
		credits_label.move_local_y(-credits_scroll_speed)
		
		if (credits_label.get_position() <= Vector2(credits_label.get_position().x, -1744)): # -1824
			if (variables.credits_to_main == true):
				credits_root.hide()
				get_parent().get_node("../Title").show()
				get_parent().get_node("../SubTitle").show()
				get_parent().get_node("../Main").show()
				credits_menu = false
				variables.load_credits = false
				variables.completed_screen = false
			else:
				credits_root.hide()
				get_parent().get_node("Help").show()
				credits_menu = false
				variables.load_credits = false
#			credits_label.set_pos(Vector2(credits_label.get_pos().x, 450))
	else:
		credits_label.set_position(Vector2(credits_label.get_position().x, 0))
	pass


func back(): # Reuturns to different scenes based on where the user is coming from.
	if (variables.credits_to_main == true): # If the user has finsih the game.
		credits_root.hide()
		get_parent().get_node("../Main").show()
		get_parent().get_node("../Title").show()
		get_parent().get_node("../SubTitle").show()
		credits_menu = false
		variables.load_credits = false
		variables.completed_screen = false
	else: # If the user is coming from the help menu to the credits menu.
		credits_root.hide()
		get_parent().get_node("../Title").show()
		get_parent().get_node("../SubTitle").show()
		get_parent().get_node("Help").show()
		credits_menu = false
		variables.load_credits = false
	pass
