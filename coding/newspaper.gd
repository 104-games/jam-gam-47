extends Sprite2D

var text = [
	"Mestle ranked last in all evirovmental metrics for 14th year in a row, expert from `The Economic` says: `to improve profits you need to sell to young people, and they love green stuff, so i would advise not investing in mestle because they won't be able to expand their profits much`",
	"Mestle CEO is now in the middle of internet backlash! Two days ago activists from `exstermination revolt` vandalized his private jett and on one of his two yachts, the CEO repsonded on twitter that he would `vandalize their mothers`and then added a photo of him on his other yach with a shotgun and `waiting` as caption",
	"Mestle's workers from factories in the amazon forest declare an indefinite strike, the leader of the workers declared `mestle waste disposing practices have destroyed the land where we live! many of our kids are sick and we don't get paid enought to cure them, may the world see our struggle and stop Mestle`",
	"[REDACTED]'s candidate Jack Ingoff declared during his last rally `I'm going to impose a carbon tax on day 1, we need stronger envirovmental regulations!`, expert from `The Economic` declared:`I love the envirovment, but his would destroy profits! can't we do more recycling instead?`",
	"Meste is now the main target of the envirovmental student led movement against big multinationals, one of the leaders of the movement Tega Lumberg said `Mestle's action in the amazon are desplicable, we demant the CEO to be arrested now, him and shareholders profited from the death of 17 KIDS!!`",
	"Mestle workers declare strike again after reciving donations from people all over the world, this time the leader declared `The people of the world are on our side! even the police is helping us! We will SEIZE the factory if needed and change the waste disposal method ourselves!`, police instead of breaking the strike joined the workers.",
	"Famous reporter Josh Brown, died yesterday at age 31, the police report declared it a suicide, many of his friend enraged ask to see his body, his mother declared `my son was about to expose some powerfull people! he coudn't have killed himself! let me see my boy`, however the police still hasn't released the body.",
]

var mouse_in = false 

var is_dragged = false

var is_zoomed = false

signal zoomed
signal unzoomed

func _ready():
	$text.text = text[globals.current_day]

func _process(_delta):
	if Input.is_action_just_pressed("left_click") and is_dragged == false: #if mouse is clicked
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
			print(mouse_in)
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
			
#set if mouse is in or out
func _on_scanbox_mouse_entered():
	mouse_in = true 

func _on_scanbox_mouse_exited():
	mouse_in = false
