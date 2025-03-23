extends Sprite2D
#matrix with a list of lines of dialogue from each day
var dialogues_day1 = [[["Hey, how's your first day on the job?", 
				"Listen, we have no time to chit chat, you have a lot to do!", 
				"We hired you because the pubblic does not have a great opinion of our enviromental policies",
				"and we don't want to let down our shareolders, do we? so you need to change their mind!",
				"While spending the least amount of money! Remember, profits over everything.",
				"I have to go, your secretary should have left you the documents you need to work on, on your desk.",
				"When you are ready to make a decision; open your pc, print out an executive order and stamp it!",
				"Pretty easy huh? goodbye!"],
				["Hey honey *cough* how is your first day on the job?", 
				"I'm so happy you got that promotion! With all this new income, we'll be able to pay for the medical bills.",
				"So I can heal *cough cough* and be with you all day again!",
				"Anyway, I don't want to take more time from your important job, goodbye honey!"]]]

var dialogues = [[["Hey, how's your first day on the job?", 
				"Listen, we have no time to chit chat, you have a lot to do!", 
				"We hired you because the pubblic does not have a great opinion of our enviromental policies",
				"and we don't want to let down our shareolders, do we? so you need to change their mind!",
				"While spending the least amount of money! Remember, profits over everything.",
				"I have to go, your secretary should have left you the documents you need to work on, on your desk.",
				"When you are ready to make a decision; open your pc, print out an executive order and stamp it!",
				"Pretty easy huh? goodbye!"],
				["Hey honey *cough* how is your first day on the job?", 
				"I'm so happy you got that promotion! With all this new income, we'll be able to pay for the medical bills.",
				"So I can heal *cough cough* and be with you all day again!",
				"Anyway, I don't want to take more time from your important job, goodbye honey!"]],
	#day 2
	[["hey man, our pubblic reputation has gone up, but remember to chill it with the spening",
	"nice one! pr up and we didn't loose much profit! keep it up!", 
	"hey, you are here to improve our reputation!!! Improve it our we'll fire you"],
	
	["Wow you are already a pro, we can always spare some money for some `gifts` to people to improve our reputation",
	"I have seen an article saying good stuff about us, good job, but don't be afraid to offer `incentives` to the media",
	"don't be afraid to promote us to the media, usually they need a little `incentive`"]],
	
	
	#day 3
	[["The charity gala did wonders! now our CEOs is fine, let's hope he can keep it this way.",
	"WHAT THE HELL MAN!!! the apology video was HATED now his reputation is lower than ever, that was one shitty advice",
	"Not dragging it out was probably the right call, people mooved on and we saved some money."],
	
	["We had to spend some money but at least now we can legally claim that our CO2 emissions went down",
	"You spent to much money, you are FIRED!!!!! our profit matter more than any fking planet! idiot never show you face again",
	"We saved some money, but being in the list of companies that are not improving is not good pr."]],
	
	
	#day 4
	[["They got back to work immediatly, but they told the media about the threats and now we lost some pr",
	"AHAAHA the allegations against the strikers were yours? nice one the media ate it up perfectly, unfortunatly they striked for long so we lost some money",
	"Wrong call, the media is still talking about the strike and we are loosing money"],
	
	["The `green` product line was a nice idea, people buy it even if kids in vietnam made it ahahahah",
	"Did some college kids they really think they could hurt a multinational profit? we only lost some pr but money is still up",
	"I love to see those dumb envirovmentalists infight! `you're a transphobe! no you are not green enough!` they forgot us, it wasn't cheap, but it was worth"]],
	
	
	#day 5
	[["By standing with Jack our company got trendy among kids, nice call!",
	"Well now our ceo's reputation is a bit stained but the other side loves us so nice call",
	"We lost money because people want to buy only from companies that support their political party, not a nice call"],
	
	["We did the right thing, now Jack's adversay won and even if spent some money it's less than what a carbon tax would cost us",
	"We spent so much money but Jack exposed us by saying that we were trying to bribe him into more moderate stances!",
	"JACK FKING WON!! we are going to loose so much money to the carbon tax and the regulations!!"]],
	
	
	#day 6
	[["well the gov did not listen and our profits are untouched but the protest brought visibility to our company business",
	"Sure infilitrates are expensive nowdays but they worked nontheless now the media is attacking the protests",
	"They took the money and ratted us out to the media, these evirovmentalists have no honour!!!! this is a big hit to our pr"],
	
	["Good call to `gift` something to the media, now they stopped talking",
	"That was REALLY expensive, but it got us A LOT of good pr, so maybe it was worth it, only time will tell",
	"We are still making a lot of money, and we didn't loose that much pr!"]],
	
	
	#day 7
	[["Well, it's unfortunate our friend had such a strong depression he shot twice!",
	"WHAT WHERE YOU THINKING, these fking commies, it's almost if they don't care about money!~, you're fired!",
	"WHAT WERE YOU EVEN HIRED FOR? your job WAS to make sure stuff like this does not happen, you're fired!"],
	["GOOD JOB, the problem is fixed now, did those stupid workers think they could threaten us?",
	"Those bastards seazed our factiories when we fired them and the police is protecting them???? this is horrible",
	"In the end they broke the strike, we lost pr and some money but it could have been worse."]]]
	
var dialogue_day2

var char = 0
@onready var bubble = $text
@onready var cooldown = $timer

var current_string
var strings_completed = 0

var writing  = false

var character = globals.times_answered_phone

var todays_characters = len(dialogues[globals.current_day])

signal phone_ringing



func start_write():
	bubble.text = ""
	char = 0
	cooldown.start()
	if globals.current_day == 0:
		current_string = dialogues[globals.current_day][character][strings_completed]
	else:
		if character == 0:
			current_string = dialogues[globals.current_day][0][globals.last_day_choice1]
		else:
			current_string = dialogues[globals.current_day][1][globals.last_day_choice2]
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
				if globals.current_day == 0:
					strings_completed+=1

			else:
				if globals.current_day == 0:
					if strings_completed == len(dialogues[globals.current_day][character]):
						character+=1
						globals.times_answered_phone +=1
						if character <= 1:
							phone_ringing.emit() 
							strings_completed = 0
						hide()
					else:
						start_write()
						strings_completed+=1
				else:
					globals.times_answered_phone +=1
					if character < 1:
						character+=1
						start_write()
						
					else:
						if globals.pubblic_reputation < 0 or globals.money_level < 0:
							get_tree().change_scene_to_file("res://scenes/lost.tscn")
						hide()
