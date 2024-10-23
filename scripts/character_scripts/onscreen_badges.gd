extends Control

@onready var shiny_rock_badge: TextureRect = $Badges/ShinyRockBadge
@onready var bowl: TextureRect = $Badges/BowlBadge


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pb = PlayerState.player_badges
	if pb["shiny_rock"]:
		shiny_rock_badge.visible = true
	if pb["bowl"]:
		bowl.visible = true
