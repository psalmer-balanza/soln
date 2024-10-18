extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("area entered")
	animation_player.play("appear")


func _on_area_2d_area_exited(area: Area2D) -> void:
	print("area exited")
	animation_player.play("disappear")
