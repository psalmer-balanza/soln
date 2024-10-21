extends Control

@onready var bowl: TextureRect = $Badges/Bowl

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pb = PlayerState.player_badges
	if pb["bowl"]:
		bowl.visible = true
