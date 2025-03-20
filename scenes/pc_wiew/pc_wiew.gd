extends Node2D

var choiches = [["order to use recycled paper in the office","we should promote our paper initiative "],
				["we should improve our CEO's reputation"]]

var options = [ #day 1
				[["Yes, also make sure it is ethically made","Yes, but go with the cheapest one","No, keep the old paper"],
				["yes, add some money to ensure first page","yes, just a letter should be fine","no, no need to bother"]],
				#day 2
				["Yes, pay the media to lie and tell good stuff","yes, ask him to donate some money","no, best to not piss him off"]]

var conseguences = [#day1
					[[Vector2(+5,-5),Vector2(+2,-2),Vector2(-2,+2)],[Vector2(+2,-2),Vector2(+1,0),Vector2(0,+1)]],
					#day 2
					[[Vector2(+3,-3),Vector2(+2,-1),Vector2(0,+2)]]]

var selected 

var day = globals.current_day
func _ready():
	if globals.approved_today==len(choiches[day]):
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
	$current_selected.show()
	$print.show()
	$current_selected.text = "selecting this option gives " + str(conseguences[day][globals.approved_today][0].x) + " 
	pubblic opinion, and " + str(conseguences[day][globals.approved_today][0].y) + " profit rate"
	selected = 0

func _on_choiche_2_pressed():
	$current_selected.show()
	$print.show()
	$current_selected.text = "selecting this option gives " + str(conseguences[day][globals.approved_today][1].x) + " 
	pubblic opinion, and " + str(conseguences[day][globals.approved_today][1].y) + " profit rate"
	selected = 1 

func _on_choiche_3_pressed():
	$current_selected.show()
	$print.show()
	$current_selected.text = "selecting this option gives " + str(conseguences[day][globals.approved_today][2].x) + " 
	pubblic opinion, and " + str(conseguences[day][globals.approved_today][2].y) + " profit rate"
	selected = 2

func _on_print_pressed():
	
	globals.doc_info = conseguences[day][globals.approved_today][selected]
	globals.desk_items[day].append("document")
	get_tree().change_scene_to_file("res://scenes/desk wiew/desk_wiew.tscn")
