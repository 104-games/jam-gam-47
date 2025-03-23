extends Sprite2D

var mouse_in = false 

var is_dragged = false

var is_zoomed = false

signal zoomed
signal unzoomed

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("left_click") and is_dragged == false: #if mouse is clicked
		if mouse_in == true: #if mouse is inside the area
			is_dragged = true
			FmodServer.play_one_shot("event:/SFX_PickupDocument")
	if is_dragged: #if is in dragged state
		if Input.is_action_just_released("left_click"):
			is_dragged = false #go back to normal state
			FmodServer.play_one_shot("event:/SFX_PutDownDocument")
		else:
			global_position = get_global_mouse_position() #set position to mouse pos
	if mouse_in:
		if Input.is_action_just_released("right_click"):
			print(mouse_in)
			if is_zoomed:
				scale/=1.5
				unzoomed.emit()
				top_level = false
				z_index = 0
				is_zoomed = false
			else:
				global_position = get_viewport_rect().size /2
				scale*=1.5
				z_index = 1
				zoomed.emit()
				top_level = true
				is_zoomed = true
			
#set if mouse is in or out
func _on_scanbox_mouse_entered():
	mouse_in = true 

func _on_scanbox_mouse_exited():
	mouse_in = false
