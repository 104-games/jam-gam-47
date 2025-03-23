extends Node2D

var text = [
	"Welcome to your job! to drag an item use the left mouse button, you can zoom on stuff by using the right mouse button. Once you have a document drag the stamper over it, release it and then drag out the stamper! -boss",
	"Those kids! they are just envious commies, they vandalized my yacht and my private jett, now what if i get tired o the other yacht! I will have to wait 3 WHOLE days for them to get cleaned. I tweeted some bad stuff, i had to much wine, it's your job to make people love me! do it or you are fired! -CEO",
	"Your company is the devil incarnated, and you are complicit in covering up the crimes! The land where dozens of generations of my ancestors lived now is a waste land, just because you couldn't care to spend a bit more in desposing the waste? 15 kids have died and many more are in the hospital, 4 whole SPECIES have gone exstint. If you have any humanity expose your company, be on the right side of history",
	"Election season is coming up, people nowdays love drama and division, so we must take a stance to get more money from people on that side that will buy from us just because the other side hates us? isn't it crazy? free money glitch, usually no matter who wins we win anyway, but this time it's different, that McBalls is a commie bastard and we must stop it before we loose 0.5% of our profit to taxes -boss",
	"Hi mister pubblic relations, I am a reporter, don't mind trying to figure out who, and i am going to expose the damage your company is doing to the envirovment, you either help me and become an hero or stay at your shitty job and go down rich but as a monster. Now 25 people have died in the amazon, 17 were kids, experts prediceted that the land will remain inlivable for at least two centuries, do the right thing.",
	"I have found out who sent you that letter yesterday, it's Josh Brown, famous activist and reporter, we can't let him complete his mission, take drastic measures if needed - company spy",
	"Heyyy, look at your pc -boss"
]

var mouse_in = false 

var is_dragged = false

var is_opened = false

signal zoomed
signal unzoomed
var is_zoomed = false

func _ready():
	$text.text = text[globals.current_day]

func _process(_delta):
	if is_opened: #if the envelope is opened the letter can be dragged
		if Input.is_action_just_pressed("left_click") and is_dragged == false: #if mouse is clicked
			print(mouse_in)
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
	
	else: #if the envelope is closed it can be opened
		if Input.is_action_just_pressed("left_click") and mouse_in:
			$envelope.play("opening")
			
			FmodServer.play_one_shot("event:/SFX_OpenLetter")
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
		$text.show()
