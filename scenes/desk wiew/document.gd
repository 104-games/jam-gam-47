extends Sprite2D

var mouse_in = false
var is_dragged = false
var stamp_sound_can_play = true

var draggable = true

func _process(_delta):
	if Input.is_action_just_released("left_click") and $stamp.visible == false:
		for item in $area.get_overlapping_areas():
			if item.get_parent().name == "stamper":
				$stamp.global_position = item.global_position
				$stamp.show()
				globals.pubblic_reputation-=globals.doc_info.y
				globals.money_level-=globals.doc_info.x
				globals.approved_today+=1
				globals.desk_items[globals.current_day].erase("document")
				if stamp_sound_can_play == true:
					FmodServer.play_one_shot("event:/SFX_Stamp")
					stamp_sound_can_play = false
	if Input.is_action_just_pressed("left_click") and is_dragged == false and draggable: #if mouse is clicked
		if mouse_in == true: #if mouse is inside the area
			is_dragged = true
			FmodServer.play_one_shot("event:/SFX_PickupDocument")
	if is_dragged: #if is in dragged state
		if Input.is_action_just_released("left_click"):
			is_dragged = false #go back to normal state
			FmodServer.play_one_shot("event:/SFX_PutDownDocument")
		else:
			global_position = get_global_mouse_position()

func _on_anim_animation_finished(anim_name):
	self.queue_free()

func _on_area_area_exited(area):
	if $stamp.visible and area.get_parent().name=="stamper":
		$anim.play("fade out")

func _on_area_mouse_entered():
	mouse_in = true

func _on_area_mouse_exited():
	mouse_in = false
	
func _exit_tree():
	stamp_sound_can_play = true


func _on_area_area_entered(area):
	if area.get_parent().name=="stamper":
		draggable = false
