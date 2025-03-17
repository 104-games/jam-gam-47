extends Node2D

var mouse_in = false 

var is_dragged = false

var is_opened = false

func _ready():
	pass

func _process(delta):
	if is_opened: #if the envelope is opened the letter can be dragged
		if Input.is_action_just_pressed("left_click") and is_dragged == false: #if mouse is clicked
			print(mouse_in)
			if mouse_in == true: #if mouse is inside the area
				is_dragged = true
		if is_dragged: #if is in dragged state
			if Input.is_action_just_released("left_click"):
				is_dragged = false #go back to normal state
			else:
				global_position = get_global_mouse_position() #set position to mouse pos
	else: #if the envelope is closed it can be opened
		if Input.is_action_just_pressed("left_click") and mouse_in:
			$envelope.play("opening")
			scale.x = 0.3 #to be deleted, just for testing
			scale.y = 0.3
	
#set if mouse is in or out
func _on_scanbox_mouse_entered():
	mouse_in = true 

func _on_scanbox_mouse_exited():
	mouse_in = false

#check when the letter is opened
func _on_envelope_animation_finished():
	if $envelope.animation == "opening":
		is_opened = true
