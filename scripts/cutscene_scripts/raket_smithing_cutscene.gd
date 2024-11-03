extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var raket_sfx = $RaketSmithingSFX
@onready var crab_sfx = $GiantCrabSFX
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Current quest while cutscene scene is playing: ", DialogueState.current_quest)
	if DialogueState.current_quest == "sword_finished":
		print("playing raket's smithing")
		raket_sfx.play()
		animation_player.play("raket_smithing")
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")
	elif DialogueState.current_quest == "crab_boss":
		print("playing crab's swinging")
		crab_sfx.play()
		animation_player.play("crab_swinging")
		await animation_player.animation_finished
		get_tree().change_scene_to_file("res://scenes/levels/Floor2.tscn")
