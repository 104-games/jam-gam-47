extends Node2D

func _ready():
	if globals.pubblic_reputation < 0:
		$reason.text = "you failed the task of making our reputation better, now everybody hates us"
	elif globals.money_level < 0:
		$reason.text = "now everybody loves us but our shareholders left us because we lost to much money"
