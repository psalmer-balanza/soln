extends Node2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("fade")
	animation.queue("fade bg")
	animation.queue("intro")
	animation.queue("fade text 1")
	animation.queue("fade text 2")



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade text 2":
		print("New game initiated, resetting all player variables")
		#If new game, reset all variables
		PlayerState.first_time_initializing_first_floor_scene = true
		PlayerState.first_time_initializing_second_floor_scene = true
		PlayerState.first_time_initializing_third_floor_scene = true
		DialogueState.current_quest = "starting"
		PlayerState.player_badges = {
		"shiny_rock": false,
		"bowl": false,
		"carrot": false,
		"cake": false,
		"sword": false,
		"mushroom": false,
		"bucket1": false,
		"flask": false,
		"bucket2": false,
		"bucket3": false,
		"crystal_ball": false,
		"shell": false,
		"original_robot": false
		}
		# reset autoactionables
		DialogueState.rock_removed = false
		DialogueState.disable_rock_removed = false
		DialogueState.raket_sneaking_quest_complete = false
		DialogueState.unlock_cave_collision = false
		DialogueState.raket_sword_complete = false
		DialogueState.raket_quest_progress = 0
		DialogueState.do_raket_blacksmith_animation = false
		DialogueState.sword_bottom = false
		DialogueState.sword_guard = false
		DialogueState.sword_lower_blade = false
		DialogueState.sword_middle_blade = false
		DialogueState.sword_top_blade = false
		DialogueState.disable_dead_robot_quest = false
		DialogueState.disable_raket_stealing_quest = false
		DialogueState.disable_fresh_dialogue_quest = false
		DialogueState.disable_water_logged_1_quest = false
		DialogueState.disable_water_logged_2_quest = false
		DialogueState.disable_water_logged_3_quest = false
		DialogueState.disable_chip_quest = false
		DialogueState.disable_rat_wizard_training_quest = false
		Global.current_floor = 1
		get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")
