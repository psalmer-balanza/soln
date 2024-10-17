extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var sword_bottom: bool = false
var sword_guard: bool = false
var sword_lower_blade: bool = false
var sword_middle_blade: bool = false
var sword_top_blade: bool = false

func _process(_delta):
	if DialogueState.sword_bottom and not sword_bottom:
		pick_up_sword_bottom()
		sword_bottom = true
	if DialogueState.sword_guard and not sword_guard:
		pick_up_sword_guard()
		sword_guard = true
	if DialogueState.sword_lower_blade and not sword_lower_blade:
		pick_up_sword_lower_blade()
		sword_lower_blade = true
	if DialogueState.sword_middle_blade and not sword_middle_blade:
		pick_up_sword_middle_blade()
		sword_middle_blade = true
	if DialogueState.sword_top_blade and not sword_top_blade:
		pick_up_sword_top_blade()
		sword_top_blade = true
		
func pick_up_sword_bottom() -> void:
	animation_player.play("1st_disappear")
	await animation_player.animation_finished
	$"1st (Sword Bottom)".visible = false
	$"1st (Sword Bottom)/Actionable/CollisionShape2D".disabled = true

func pick_up_sword_guard() -> void:
	animation_player.play("2nd_disappear")
	await animation_player.animation_finished
	$"2nd (Sword Guard)".visible = false
	$"2nd (Sword Guard)/Actionable/CollisionShape2D".disabled = true

func pick_up_sword_lower_blade() -> void:
	animation_player.play("3rd_disappear")
	await animation_player.animation_finished
	$"3rd (Sword Lower Blade)".visible = false
	$"3rd (Sword Lower Blade)/Actionable/CollisionShape2D".disabled = true

func pick_up_sword_middle_blade() -> void:
	animation_player.play("4th_disappear")
	await animation_player.animation_finished
	$"4th (Sword Middle Blade)".visible = false
	$"4th (Sword Middle Blade)/Actionable/CollisionShape2D".disabled = true

func pick_up_sword_top_blade() -> void:
	animation_player.play("5th_disappear")
	await animation_player.animation_finished
	$"5th (Sword Top Blade)".visible = false
	$"5th (Sword Top Blade)/Actionable/CollisionShape2D".disabled = true
