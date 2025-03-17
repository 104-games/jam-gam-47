extends Sprite2D

var mouse_in = false 

var is_dragged = false

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("left_click") and is_dragged == false: #if mouse is clicked
		if mouse_in == true: #if mouse is inside the area
			is_dragged = true
	if is_dragged: #if is in dragged state
		if Input.is_action_just_released("left_click"):
			is_dragged = false #go back to normal state
		else:
			global_position = get_global_mouse_position() #set position to mouse pos

#set if mouse is in or out
func _on_scanbox_mouse_entered():
	mouse_in = true 

func _on_scanbox_mouse_exited():
	mouse_in = false
