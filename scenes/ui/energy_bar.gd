extends Control

@onready var energy_bar= $Energy
var current_energy

func _process(delta: float) -> void:
	current_energy = Global.user_energy * 20
	energy_bar.value = current_energy
