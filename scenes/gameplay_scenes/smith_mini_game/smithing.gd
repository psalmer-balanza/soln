extends Node2D

@onready var ores_inside = Global.ores_inside
@onready var current_fullness = $current_fullness

var numerator:int = 0
@onready var denomenator:int = $ores_container.get_child_count()

func _ready() -> void:
	Global.ores_inside = 0

func _process(delta: float) -> void:
	numerator = ores_inside
	current_fullness.text = str(numerator) + " / " + str(denomenator)
