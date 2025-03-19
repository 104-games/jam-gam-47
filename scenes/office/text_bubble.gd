extends Sprite2D
#matrix with a list of lines of dialogue from each day
var dialogues = [["hey, how's your first day on the job?", 
				"listen we have no time to chit chat, you have a lot to do!", 
				"we hired you because the pubblic does not have a great opinion of our enviromental policies",
				"and we don't want to let down our shareolders, do we? so you need to change their mind!",
				"while spending the least amount of money! remember, profists over everything",
				"i have to go, your secretay should have left you the documents you need to work on, on your desk",
				"when you are ready to make a decision open your pc, print out an executive order and stamp it!",
				"pretty easy uh? goodbye!"]] 

var char = 0
@onready var bubble = $text
@onready var cooldown = $timer

var current_string
var strings_completed = 0

var writing  = false



func start_write():
	bubble.text = ""
	char = 0
	cooldown.start()
	current_string = dialogues[globals.current_day][strings_completed]
	writing = true


func _on_timer_timeout():
	if char<len(current_string):
		bubble.text += current_string[char]
		char+=1
		cooldown.start()
	else:
		writing = false

func _process(_delta):
	if visible:
		if Input.is_action_just_pressed("left_click"):
			if writing:
				cooldown.stop()
				writing = false
				bubble.text = current_string
				strings_completed+=1
			else:
				if strings_completed == len(dialogues[globals.current_day]):
					
					hide()
				else:
					start_write()
