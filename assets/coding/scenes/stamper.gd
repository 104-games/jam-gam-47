extends Sprite2D

var is_dragged = false
var mouse_in = false
var stamp_pickup_sfx_can_play = true

func _process(_delta):
	if Input.is_action_just_pressed("left_click") and is_dragged == false: #if mouse is clicked
		if mouse_in == true: #if mouse is inside the area
			is_dragged = true
			if stamp_pickup_sfx_can_play == true:
				FmodServer.play_one_shot("event:/SFX_PickupStamp")
				stamp_pickup_sfx_can_play = false
	if is_dragged: #if is in dragged state
		if Input.is_action_just_released("left_click"):
			is_dragged = false #go back to normal state
			stamp_pickup_sfx_can_play = true
			FmodServer.play_one_shot("event:/SFX_PutDownStamp")
		else:
			global_position = get_global_mouse_position() #set position to mouse pos



func _on_scanbox_mouse_entered():
	mouse_in = true


func _on_scanbox_mouse_exited():
	mouse_in = false
