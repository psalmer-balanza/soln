extends Control

func _ready():
	print("Current IP address: ", Global.host_ip)

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/Floor1.tscn")


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit(0)
