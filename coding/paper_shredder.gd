extends AnimatedSprite2D


var mouse_in = false
var to_remove = []
func _process(delta):
	if Input.is_action_just_released("left_click") and mouse_in:
		for item in $scanarea.get_overlapping_areas():
			print(item.get_parent().name)
			to_remove.append(item.get_parent().name)
			item.get_parent().free()
			play("shred")
			FmodServer.play_one_shot("event:/SFX_Shred")
		for x in to_remove:
			if x == "newspaper":
				globals.desk_items[globals.current_day].erase("newspaper")
			elif x == "letter":
				globals.desk_items[globals.current_day].erase("letter")
			elif x == "document":
				globals.desk_items[globals.current_day].erase("document")
			print(globals.desk_items[globals.current_day])


func _on_scanarea_mouse_entered():
	mouse_in = true


func _on_scanarea_mouse_exited():
	mouse_in = false
