extends Node2D

var days = ["MONDAY 8 AM","TUESDAY 8 AM","WEDNESDAY 8 AM","THURSDAY 8 AM","FRIDAY 8 AM","SATURDAY 8 AM","SUNDAY 8 AM"]

func _ready():
	print("gg")
	if globals.day_just_started:
		$day.text = days[globals.current_day]
		$anim.play("fade")
		
		
