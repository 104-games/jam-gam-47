extends FmodEventEmitter2D

var can_play = true

func _process(_delta):
	var office = get_tree().current_scene
	var phone_ringing = office.phone_ringing
	if office.phone_ringing and can_play:
		print("yes")
		self.play()
		can_play = false
	elif !phone_ringing and!can_play:
		print("no")
		self.stop()
		FmodServer.play_one_shot("event:/SFX_AnswerPhone")
		can_play = true
