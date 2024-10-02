extends Node2D

@onready var fullness_label = $Label
@onready var ore_container = $ore_container
@onready var ores_inside = Global.ores_inside
@onready var liquid_metal = $AnimationPlayer

var current_number_ores = 0
var total_number_ores

func _ready() -> void:
	total_number_ores = ore_container.get_child_count()

func _process(delta: float) -> void:
	current_number_ores = total_number_ores - ore_container.get_child_count()
	fullness_label.text = str(current_number_ores) + " / " + str(total_number_ores)
	liquid_metal.play(str(current_number_ores * 20))

func _on_melting_pot_body_entered(body: Node2D) -> void:
	ores_inside.append(body)

func _on_melting_pot_body_exited(body: Node2D) -> void:
	ores_inside.erase(body)
