extends Sprite2D
#matrix with a list of lines of dialogue from each day
var dialogues = [[["hey, how's your first day on the job?", 
				"listen we have no time to chit chat, you have a lot to do!", 
				"we hired you because the pubblic does not have a great opinion of our enviromental policies",
				"and we don't want to let down our shareolders, do we? so you need to change their mind!",
				"while spending the least amount of money! remember, profists over everything",
				"i have to go, your secretay should have left you the documents you need to work on, on your desk",
				"when you are ready to make a decision open your pc, print out an executive order and stamp it!",
				"pretty easy uh? goodbye!"],
				["Hey honey *cough* how is the first day of your new job?", 
				"I'm so happy you got that promotion! with this new money steam we will be able to pay for the mediacal bills",
				"so i can heal *cough cough* and be with you all day again!",
				"i don't want to take more time from your important job, goodbye!"]]] 


var char = 0
@onready var bubble = $text
@onready var cooldown = $timer

var current_string
var strings_completed = 0

var writing  = false

var character = 0

var todays_characters = len(dialogues[globals.current_day])

signal phone_ringing

func start_write():
	bubble.text = ""
	char = 0
	cooldown.start()
	current_string = dialogues[globals.current_day][character][strings_completed]
	writing = true


func _on_timer_timeout():
	if char<len(current_string):
		bubble.text += current_string[char]
		char+=1
		cooldown.start()
	else:
		writing = false

func _process(_delta):
	FmodServer.set_global_parameter_by_name("CharacterTalking", character)
	if visible:
		if Input.is_action_just_pressed("left_click"):
			if writing:
				cooldown.stop()
				writing = false
				bubble.text = current_string
				strings_completed+=1
			else:
				if strings_completed == len(dialogues[globals.current_day][character]):
					character+=1
					if character < todays_characters:
						phone_ringing.emit()
						strings_completed = 0
					hide()
				else:
					start_write()
