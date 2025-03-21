extends Node2D

func _ready():
	if globals.day_just_started:
		$anim.play("fade")
		globals.day_just_started = false
		FmodServer.play_one_shot("event:/SFX_MorningStart")
