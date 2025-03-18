extends Node2D

var phone_ringing = false

func _on_to_desk_pressed():
	if $text_bubble.visible == false:
		get_tree().change_scene_to_file("res://scenes/desk wiew/desk_wiew.tscn")


func _on_answer_phone_pressed():
	if phone_ringing:
		$text_bubble.show()
		$text_bubble.start_write()
		phone_ringing = false


func _on_anim_animation_finished(anim_name):
	phone_ringing = true
	$day_start_animation.free()


func _on_pc_pressed():
	if globals.printed_doc == false:
		get_tree().change_scene_to_file("res://scenes/pc_wiew/pc_wiew.tscn")
