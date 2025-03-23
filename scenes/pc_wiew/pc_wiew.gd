extends Node2D

var choiches = [
		["order to use recycled paper in the office","we should promote our paper initiative "],
		["we should improve our CEO's reputation","our CO2 emissions has gone up this year, the media will criticize us"],
		["your workers striking is going to hurt our reputation","ambientalist org calls for a boycott aganist our company"],
		["our company should take a stance!","what should we do secretly to protect our profits"],
		["what should we do about the protests?","we must hide what we are doing in the amazon before it spreadts to much"],
		["what should we do about this reporter?","this strike has to end now and never come back"]]

var options = [ #day 1
	[["Yes, also make sure it is ethically made","Yes, but go with the cheapest one","No, keep the old paper"],
	["yes, add some money to ensure first page","yes, just a letter should be fine","no, no need to bother"]],
	#day 2
	[["Organize a charity gala","Tell him to make an apology video","do nothing, better not to drag it"],
	["Buy carbon credit to legally say it didn't","Cut emissions by using renewables in production","do nothing"]],
	#day 3
	[["Threaten to fire them all","`invest`some money to spread rumors against them","do nothing"],
	["Create a `green`product line","do nothing because boycotts ha no effect","pay another 'ambientalist' org to infight against them"]],
	#day 4
	[["make the Ceo tweet in favor of Jack","Make ceo tweet that Jack is a criminal radical marxist","better to not take a sidea"],
	["send money to help Jack's adversary win","send money to both sides","do not interfere in democracy"]],
	#day 5
	[["do nothing, the gov never listens to protests","send infiltrates to turn them into riots","try to bribe the leaders of the protest to change target to a rival company"],
	["pay the media to downplay it","offer compensations to the affected familys","do nothing"]],
	#day 6
	[["Make so that he `suicides` with two bulltet holes","try to bribe him","do nothing"],
	["pay the gov to send in the army and teach them a lesson","fire them all","do nothing"]],
	]

var conseguences = [#day1
	[[Vector2(+2,-2),Vector2(+1,-1),Vector2(-0,+2)],[Vector2(+2,-1),Vector2(+1,0),Vector2(0,+1)]],
	#day 2
	[[Vector2(+3,-3),Vector2(-5,0),Vector2(0,+2)],[Vector2(+1,-2),Vector2(+100,-1000),Vector2(-2,-2)]],
	#day 3
	[[Vector2(-2,+2),Vector2(+2,-2),Vector2(-2,-2)],[Vector2(+1,-1),Vector2(-1,+1),Vector2(+2,-2)]],
	#day 4
	[[Vector2(+2,+0),Vector2(-1,+1),Vector2(0,-1)],[Vector2(0,-1),Vector2(-4,-2),Vector2(+1,-4)]],
	#day 5
	[[Vector2(-2,+2),Vector2(+1,-1),Vector2(-4,-1)],[Vector2(0,-1),Vector2(+5,-5),Vector2(-2,+2)]],
	#day 6
	[[Vector2(-1,0),Vector2(-1000,0),Vector2(-100,+2)],[Vector2(0,-2),Vector2(-4,-4),Vector2(-3,-5)]]]

var selected = -1

var day = globals.current_day
func _ready():
	if globals.current_day == 6:
		$choiche.text = "hey man, didn't want to tell you on the phone, our company is now so loved by the pubblic and so rich we don't need you anymore! sorry friend, nothing personal, just business. PS: hope your wife gets better even without healt isnurance!"
		$end.show()
		$choiche1.free()
		$choiche2.free()
		$choiche3.free()
		$print.free()
	elif globals.approved_today==len(choiches[day]):
		$choiche.text = "you have completed your work for today"
		$end.show()
		$choiche1.free()
		$choiche2.free()
		$choiche3.free()
		$print.free()
	
	else:
		$choiche.text = choiches[day][globals.approved_today]
		$choiche1.text = options[day][globals.approved_today][0]
		$choiche2.text = options[day][globals.approved_today][1]
		$choiche3.text = options[day][globals.approved_today][2]


func _on_choiche_1_pressed():
	FmodServer.play_one_shot("event:/SFX_MouseClick")
	$print.show()

	selected = 0
	if globals.approved_today == 0:
		globals.last_day_choice1 = 0
	else: 
		globals.last_day_choice2 = 0

func _on_choiche_2_pressed():
	FmodServer.play_one_shot("event:/SFX_MouseClick")
	$print.show()

	selected = 1 
	if globals.approved_today == 0:
		globals.last_day_choice1 = 1
	else: 
		globals.last_day_choice2 = 1

func _on_choiche_3_pressed():
	FmodServer.play_one_shot("event:/SFX_MouseClick")
	$print.show()
	selected = 2
	if globals.approved_today == 0:
		globals.last_day_choice1 = 1
	else: 
		globals.last_day_choice2 = 1

func _on_print_pressed():
	if selected>-1:
		FmodServer.play_one_shot("event:/SFX_Print")
		globals.doc_info = conseguences[day][globals.approved_today][selected]
		globals.desk_items[day].append("document")
		get_tree().change_scene_to_file("res://scenes/desk wiew/desk_wiew.tscn")


func _on_end_pressed():
	if globals.current_day == 6:
		get_tree().change_scene_to_file("res://scenes/end.tscn")
	else:
		globals.day_just_started = true
		globals.current_day+=1
		globals.times_answered_phone = 0
		get_tree().change_scene_to_file("res://scenes/office/office.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/office/office.tscn")
