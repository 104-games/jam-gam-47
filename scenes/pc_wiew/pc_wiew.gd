extends Node2D

var choiches = ["order to use recycled paper in the office"]

var options = [["Yes, also make sure it is ethically made","Yes, but go with the cheapest one","No, keep the old paper"]]

var conseguences = [[Vector2(+5,-5),Vector2(+2,-2),Vector2(-2,+2)]]

var selected 

var day = globals.current_day
func _ready():
	
	$choiche.text = choiches[day]
	$choiche1.text = options[day][0]
	$choiche2.text = options[day][1]
	$choiche3.text = options[day][2]


func _on_choiche_1_pressed():
	$current_selected.show()
	$print.show()
	$current_selected.text = "selecting this option gives " + str(conseguences[day][0].x) + " pubblic opinion, and " + str(conseguences[day][0].y) + " profit rate"
	selected = 0

func _on_choiche_2_pressed():
	$current_selected.show()
	$print.show()
	$current_selected.text = "selecting this option gives " + str(conseguences[day][1].x) + " pubblic opinion, and " + str(conseguences[day][1].y) + " profit rate"
	selected = 1 

func _on_choiche_3_pressed():
	$current_selected.show()
	$print.show()
	$current_selected.text = "selecting this option gives " + str(conseguences[day][2].x) + " pubblic opinion, and " + str(conseguences[day][2].y) + " profit rate"
	selected = 2

func _on_print_pressed():
	
	globals.printed_doc = conseguences[day][selected]
	globals.desk_items.append("document")
	get_tree().change_scene_to_file("res://scenes/desk wiew/desk_wiew.tscn")
