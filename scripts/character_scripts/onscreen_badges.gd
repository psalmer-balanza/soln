extends Control

##FLOOR1 BADGES
@onready var shiny_rock_badge: TextureRect = $Badges/ShinyRockBadge
@onready var bowl: TextureRect = $Badges/BowlBadge
@onready var carrot_badge: TextureRect = $Badges/CarrotBadge
@onready var cake_badge: TextureRect = $Badges/CakeBadge
@onready var sword_badge: TextureRect = $Badges/SwordBadge
##FLOOR2 BADGES
@onready var crystal_ball_badge: TextureRect = $Badges/CrystalBallBadge
@onready var flask_badge: TextureRect = $Badges/FlaskBadge


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pb = PlayerState.player_badges
	#Saisai wheelbarrow
	if pb["shiny_rock"]:
		shiny_rock_badge.visible = true
	#Saisai house
	if pb["bowl"]:
		bowl.visible = true
	#Dead robot
	if pb["carrot"]:
		carrot_badge.visible = true
	#Raket stealing
	if pb["cake"]:
		cake_badge.visible = true
	#Raket sword collected
	if pb["sword"]:
		sword_badge.visible = true
	#After snake quiz
	if pb["mushroom"]:
		sword_badge.visible = true
		
	##FLOOR1 BADGES
	#After wizard rat training
	if pb["crystal_ball"]:
		crystal_ball_badge.visible = true
	#After snake quiz
	if pb["flask"]:
		flask_badge.visible = true
