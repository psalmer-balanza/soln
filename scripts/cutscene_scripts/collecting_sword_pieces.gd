extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var sword_bottom: bool = false
var sword_guard: bool = false
var sword_lower_blade: bool = false
var sword_middle_blade: bool = false
var sword_top_blade: bool = false
var sword_complete = false

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
	if not DialogueState.sword_pieces_complete and not sword_complete:
		DialogueState.sword_pieces_complete = true
		sword_complete = true

func pick_up_sword_bottom() -> void:
	animation_player.play("sword_bottom_gone")
	$SwordBottom/Actionable/CollisionShape2D.disabled = true
	$SwordBottom/ExclamationMark.visible = false

func pick_up_sword_guard() -> void:
	animation_player.play("sword_guard_gone")
	$SwordGuard/Actionable/CollisionShape2D.disabled = true
	$SwordGuard/Actionable/ExclamationMark2.visible = false

func pick_up_sword_lower_blade() -> void:
	animation_player.play("sword_lower_blade_gone")
	$SwordLowerBlade/Actionable/CollisionShape2D.disabled = true
	$SwordLowerBlade/ExclamationMark3.visible = false

func pick_up_sword_middle_blade() -> void:
	animation_player.play("sword_middle_blade_gone")
	$SwordMiddleBlade/Actionable/CollisionShape2D.disabled = true
	$SwordMiddleBlade/ExclamationMark4.visible = false

func pick_up_sword_top_blade() -> void:
	animation_player.play("sword_top_blade_gone")
	$SwordTopBlade/Actionable/CollisionShape2D.disabled = true
	$SwordTopBlade/ExclamationMark5.visible = false
