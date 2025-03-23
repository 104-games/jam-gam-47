extends Node2D

var days = ["FIRST WEEK","SECOND WEEK","THIRD WEEK","FOURTH WEEK","FIFTH WEEK","SIXTH WEEK","SEVENTH WEEK"]

func _ready():
	if globals.day_just_started:
		$day.text = days[globals.current_day]
		$anim.play("fade")
		
		globals.day_just_started = false
		FmodServer.play_one_shot("event:/SFX_MorningStart")
