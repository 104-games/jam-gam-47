extends AnimatedSprite2D

func _process(_delta):
	if Input.is_action_just_released("left_click"):
		for item in $scanarea.get_overlapping_areas():
			item.get_parent().free()
			play("shred")
