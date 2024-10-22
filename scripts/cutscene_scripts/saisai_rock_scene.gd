extends Node2D
@onready var animation_player: AnimationPlayer = $"AnimationPlayer"

var has_moved_rock = false
var show_speech_bubble = true
var disable_saisai_moving_rocks_quest = false
var remove_saisai_speech_bubble = false
@onready var saisai_rock_scene = $"."

func _process(_delta):
	if DialogueState.current_quest == "saisai_house_invite" and not has_moved_rock:
		play_move_rock()
		has_moved_rock = true
	elif DialogueState.current_quest == "saisai_wheelbarrow":
		
		$Saisai/Actionable/CollisionShape2D.disabled = true
		$Saisai/AutoActionable/CollisionShape2D.disabled = false
	elif DialogueState.current_quest == "saisai_house_invite":
		$Saisai/AutoActionable/CollisionShape2D.disabled = true
		$Saisai/Actionable/CollisionShape2D.disabled = true
		
		
	if remove_saisai_speech_bubble == true: 
		$Saisai/RadialDialogueIndicator.visible = false
	if disable_saisai_moving_rocks_quest:
		$Saisai/Actionable/CollisionShape2D.disabled = true

func _ready():
	if disable_saisai_moving_rocks_quest:
		saisai_rock_scene.queue_free()

func play_move_rock() -> void:
	# Remove speech bvubble and saisai collision
	remove_saisai_speech_bubble = true 
	$Saisai/CollisionPolygon2D.disabled = true
	
	# PLAY ANIMATION OF SAISAI LEAVING WITH THE ROCKS
	animation_player.play("saisai_move_rock")
	await animation_player.animation_finished
	animation_player.play("moving_wheelbarrow")
	await animation_player.animation_finished
	
	# HIDE SAISAI AND HER WHEELBARROW
	$Saisai/AnimatedSprite2D.visible = false
	$WheelbarrowWithRocks.visible = false
	
	# REMOVE ROCKS AND THEIR COLLISION SHAPES
	$RegularRock/Barrier.disabled = true
	$RegularRock/CollisionShape2D.disabled = true
	$RegularRock2/CollisionShape2D.disabled = true
	$RegularRock2/Sprite2D.visible = false
	$RegularRock3/CollisionShape2D.disabled = true
	$RegularRock3/Sprite2D.visible = false
	
	# HIDE THESE THINGS ONCE THEY ARE OFFSCREEN
	$WheelbarrowWithRocks/CollisionPolygon2D.disabled = true
	$Wheelbarrow/CollisionPolygon2D.disabled = true
	
	remove_saisai_speech_bubble = false
	has_moved_rock = true
	disable_saisai_moving_rocks_quest = true
