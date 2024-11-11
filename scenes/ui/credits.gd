extends Control

@onready var roll_credits = $AnimationPlayer
@onready var timer = $Timer
@onready var thankyou_screen = $ThankYou

func _ready() -> void:
	roll_credits.play("roll_credits")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	timer.start()

func _on_timer_timeout() -> void:
	thankyou_screen.visible = true
