extends FmodEventEmitter2D

var can_play = true

func _process(_delta):
	var text_bubble = get_parent()
	var writing = text_bubble.writing
	if text_bubble.writing and can_play:
		print("yes")
		self.play()
		can_play = false
	elif !writing and!can_play:
		print("no")
		self.stop()
		can_play = true
