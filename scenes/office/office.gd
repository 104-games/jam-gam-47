extends Node2D



func _ready():
	if globals.day_just_started == true:
		globals.todays_var = Vector2(globals.pubblic_reputation, globals.money_level)
		globals.day_just_started = false
		if globals.todays_var.x < 0 or globals.todays_var.y < 0:
			get_tree().change_scene_to_file("res://scenes/lost.tscn")

func _on_to_desk_pressed():
	if $text_bubble.visible == false and globals.phone_ringing==false:
		get_tree().change_scene_to_file("res://scenes/desk wiew/desk_wiew.tscn")


func _on_answer_phone_pressed():
	if globals.phone_ringing:
		$text_bubble.show()
		$text_bubble.start_write()
		
		globals.phone_ringing = false


func _on_anim_animation_finished(_anim_name):
	globals.phone_ringing = true
	globals.approved_today = 0
	$day_start_animation.free()

func _on_pc_pressed():
	if globals.desk_items[globals.current_day].has("document") == false and globals.phone_ringing==false and $text_bubble.visible == false:
		get_tree().change_scene_to_file("res://scenes/pc_wiew/pc_wiew.tscn")


func _on_text_bubble_phone_ringing():
	globals.phone_ringing = true
